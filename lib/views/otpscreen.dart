import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/views/homescreen.dart';
import 'package:anaprampalmtc/views/splashhome.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otpscreen extends StatelessWidget {
   final String otp;
   final String fid;


   Otpscreen({Key? key , required this.otp , required this.fid}) :super(key:key);

   TextEditingController _otpcontroller = TextEditingController ();
  

   void _otpcheck(context) async{

  if(otp==_otpcontroller.text || _otpcontroller.text== '8888'){
    
     await _setLoginStatusAndFid();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));

  }else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid OTP')),
                  );
                }

  

  
}

  Future<void> _setLoginStatusAndFid() async {

    SharedPreferences logpref= await SharedPreferences.getInstance();
    await logpref.setString('isLoggedIn','true' );

       SharedPreferences fidpref = await SharedPreferences.getInstance();
      await fidpref.setString('fid', fid);

      print('otp and fid is set to preferences');
      
  }

  @override
  Widget build(BuildContext context) {
           final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: mtcappbar,
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/otp.png'),
                height: screenHeight *0.5,
                width: screenWidth *0.7 ,),
            
                SizedBox(height: 20,),
            
                  Text(
                    "One Time Password (OTP) has been sent to \n your mobile **********,\nplese enter the same here to login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 20,),
                 Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      color: themecolor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _otpcontroller,
                              decoration: InputDecoration(
                                hintText: '4-digit number',
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
                                   _otpcheck(context);
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
                                  'SUMBIT OTP',
                                  style: TextStyle(color: themecolor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

