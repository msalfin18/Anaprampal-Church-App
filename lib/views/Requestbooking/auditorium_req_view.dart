import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuditoriumReqViewScreen extends StatefulWidget {
   AuditoriumReqViewScreen({super.key});

  @override
  State<AuditoriumReqViewScreen> createState() => _AuditoriumReqViewScreenState();
}

class _AuditoriumReqViewScreenState extends State<AuditoriumReqViewScreen> {
  final AuditoriumViewController _auditoriumViewController = AuditoriumViewController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchvicarmessage();
  }

  Future<void> fetchvicarmessage() async {
    await _auditoriumViewController.fetchauditoriumview();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Current Requests' , style:TextStyle(color:  Colors.black,)),backgroundColor: themecolor,),

      body: ListView.builder(

          itemCount: _auditoriumViewController.auditoriumviewList.length,
              itemBuilder: (context, index) {
                
                AuditoriumViewModel auditoriumViewModel = _auditoriumViewController.auditoriumviewList[index]; 
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding , vertical: padding *0.5),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: themecolor,
                              ),
                              width: double.infinity,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: padding),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                               
                                    Text(auditoriumViewModel.bookingDate, style: normalname),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(padding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              
                                                         Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Name : '),
                                Text(auditoriumViewModel.firstName)
                              ],
                                                         ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Address : '),
                                Text(auditoriumViewModel.address)
                              ],
                                                         ),
                              
                                                        Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Mobile : '),
                                Text(auditoriumViewModel.mobile)
                              ],
                                                         ),
                                                   Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Audi : '),
                                Text(auditoriumViewModel.audiName)
                              ],
                                                         ),
                                                   Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Purpose : '),
                                Text(auditoriumViewModel.purpose)
                              ],
                                                         ),
                              
                                                   Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Booking Date : '),
                                Text(auditoriumViewModel.bookingDate)
                              ],
                                                         )
                              
                                                         
                              ],
                              ),
                            )
 
                        
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
                ),
    );
  }
}