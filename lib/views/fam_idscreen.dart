import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:anaprampalmtc/views/otpscreen.dart'; // Ensure this is the correct import
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FamIdscreen extends StatefulWidget {
  FamIdscreen({super.key});


  @override
  State<FamIdscreen> createState() => _FamIdscreenState();
}

class _FamIdscreenState extends State<FamIdscreen> {
  //  String famid = "";

  final TextEditingController _familyidcontroller = TextEditingController();

  void otp(BuildContext ctx) async {
    if (_familyidcontroller.text.trim().isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("Family ID cannot be empty")),
      );
      return;
    }

    var response = await http.post(
      Uri.parse(OTP_URL),
      body: {
        "fid": _familyidcontroller.text.trim(),
      },
    );

    if (response.statusCode == 200) {

                     SharedPreferences prefobj = await SharedPreferences.getInstance();
               await prefobj.setString('fid',_familyidcontroller.text.trim() );

               
      var jsonData = jsonDecode(response.body);
      var jsonUserData = jsonData['data'][0]; // Adjusted based on your response format
      print(jsonUserData);

      String? otp = jsonUserData['otp'].toString(); 

      

      if (otp != null) {
        Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => Otpscreen(otp: otp, fid: _familyidcontroller.text.trim())// Ensure correct parameter passing
          ),
        );

    
                        
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text("Failed to receive OTP, try again.")),
        );
      }
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("Please try again")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mtcappbar, // Keep your existing app bar
      body: Padding(
        padding: const EdgeInsets.all(padding *0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
                Spacer(),
                
              Container(
                height: 70,
                width: 70,
                child: Image.asset('assets/ic_officials_white.png'),
              ),
              SizedBox(height: 25),
              Text(
                "Enter your family ID, we will send you the OTP to the\nregistered phone number to verify",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: themecolor, // Use defined themecolor
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _familyidcontroller,
                          decoration: InputDecoration(
                            hintText: 'Family ID',
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              otp(context);


        
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: themecolor,
                              overlayColor: themecolor,
                              backgroundColor: Colors.white, // Button color
                              shadowColor: Colors.transparent, // Remove shadow
                              elevation: 0, // Flat button
                              // side: BorderSide(color: Colors.white, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Send',
                              style: TextStyle(color: themecolor), // Keep themecolor
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
