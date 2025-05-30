import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/material.dart';

class PrayerReqViewScreen extends StatefulWidget {
  const PrayerReqViewScreen({super.key});

  @override
  State<PrayerReqViewScreen> createState() => _PrayerReqViewScreenState();
}

class _PrayerReqViewScreenState extends State<PrayerReqViewScreen> {
  
 final PrayerreqViewController _prayerreqViewController = PrayerreqViewController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPrayer();
  }

  Future<void> fetchPrayer() async {
    await _prayerreqViewController.fetchPrayerview();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Prayer Request' , style: TextStyle(color: Colors.black),),backgroundColor: themecolor,),

      body: ListView.builder(
               
               itemCount: _prayerreqViewController.prayerViewList.length,
             itemBuilder: (context ,index){
              
              PrayerViewModel _prayerviewmodel = _prayerreqViewController.prayerViewList[index];

              return Padding(
                  padding: EdgeInsets.symmetric(vertical: padding , horizontal: padding *0.5),
                  child: Column(
                    children: [

                      Text("coming soon" , style: normalname,),
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
                               
                              ],
                                                         ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Address : '),
                           
                              ],
                                                         ),
                              
                                                        Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Mobile : '),
                     
                              ],
                                                         ),
                                                   Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Audi : '),
                             
                              ],
                                                         ),
                                                   Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Purpose : '),
                                Text('')
                              ],
                                                         ),
                              
                                                   Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: [
                                Text('Booking Date : '),
                         
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