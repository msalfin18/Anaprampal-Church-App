import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/views/parish_vicar/present_vicar_message.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart'; // Import this for date formatting

class PresentVicarScreen extends StatefulWidget {
  @override
  _PresentVicarScreenState createState() => _PresentVicarScreenState();
}

class _PresentVicarScreenState extends State<PresentVicarScreen> {
  final PresentVicarController _presentVicarController = PresentVicarController();
  bool _isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchPresentVicar();
  }

  Future<void> fetchPresentVicar() async {
    await _presentVicarController.fetchPresentVicar();
    setState(() {
      _isLoading = false; // Update loading state
    });
  }

  @override
  Widget build(BuildContext context) {
            final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(title: Text('Present Vicar Message'), backgroundColor: themecolor),
      body:  _isLoading ? Center(child: constcircularprogrssindicator)
            :  Padding(
              padding:  EdgeInsets.all(padding * 0.5),
              child: ListView.builder(
                itemCount: _presentVicarController.PresentvicarList.length,
                itemBuilder: (context, index) {
                  PresentVicarModel presentvicarmodel = _presentVicarController.PresentvicarList[index];
              
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding  * 0.5 , vertical: padding * 0.8),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: themecolor),
                              shape: BoxShape.rectangle,
                              color: whitecolor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(padding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: screenHeight * 0.10,
                                    width: screenWidth * 0.3,
                                    child: Image.network(
                                      '${IMAGE_VICAR_URL}${presentvicarmodel.vicarPhoto}',
                                      height: 0.10,
                                      fit: BoxFit.scaleDown,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.person, size: screenWidth * 0.15, color: Colors.grey);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(presentvicarmodel.vicarName, style: boldname),
                                        SizedBox(height: screenHeight * 0.005),
                                          Text(presentvicarmodel.mobile, style: normalname),
           
                                      ],
                                    ),
                                  ),
                                 
                                ],
                              ),
                              
                            ),
                            
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: GestureDetector(
                            onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                             VicarMessagescreen(vicarmessage: presentvicarmodel.vicarMessage)));
                            },
                            child: Container(
                              color: themecolor,
                              width: double.infinity,
                              height: screenHeight * 0.04,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 Text('MESSAGE :' ,style: boldname,),
                                Text(presentvicarmodel.vicarMessage)
                                ],
                              ),
                            ),
                          ),
                        ),

                        
                      ],
                    ),
                  );
                  




                },
              ),
            ),
    );
  }
}
