import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart'; // Import this for date formatting

class FormerVicarScreen extends StatefulWidget {
  @override
  _FormerVicarScreenState createState() => _FormerVicarScreenState();
}

class _FormerVicarScreenState extends State<FormerVicarScreen> {
  final FormervicarController _formervicarController = FormervicarController();
  bool _isLoading = true; 

  @override
  void initState() {
    super.initState();
    fetchformervicar();
  }

  Future<void> fetchformervicar() async {
    await _formervicarController.fetchFormerVicar();
    setState(() {
      _isLoading = false; // Update loading state
    });
  }
  @override
  Widget build(BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
   
    return Scaffold(
      appBar: AppBar(title: Text('Former vicar Message'), backgroundColor: themecolor),
      body:  _isLoading ? Center(child: constcircularprogrssindicator)
            :  Padding(
              padding: EdgeInsets.all(padding *0.3),
              child: ListView.builder(
                itemCount: _formervicarController.FomrervicarList.length,
                itemBuilder: (context, index) {
                  FormerVicarModel formervicarmodel = _formervicarController.FomrervicarList[index];
              
                  return
                  Padding(
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
                                      '${IMAGE_VICAR_URL}${formervicarmodel.vicarPhoto}',
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
                                        Text(formervicarmodel.vicarPhoto, style: boldname),
                                        SizedBox(height: screenHeight * 0.005),
                                         Text('Joined : ${(formervicarmodel.startDate)}', style: normalname),
                              Text('Served Till : ${(formervicarmodel.endDate)}', style: normalname),
                          
           
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
                          child: Container(
                            color: themecolor,
                            width: double.infinity,
                            height: screenHeight * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Text('MESSAGE :' ,style: boldname,),
                              Text(formervicarmodel.vicarMessage)
                              ],
                            ),
                          ),
                        ),

                        
                      ],
                    ),
                  );
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
              

                  /////////////////////////////////////////
                },
              ),
            ),
    );
  }
}
