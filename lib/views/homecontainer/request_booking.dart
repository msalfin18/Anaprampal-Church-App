
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/views/Requestbooking/auditorium_booking.dart';
import 'package:anaprampalmtc/views/Requestbooking/auditorium_calender.dart';
import 'package:anaprampalmtc/views/Requestbooking/auditorium_req_view.dart';
import 'package:anaprampalmtc/views/Requestbooking/prayer_booking.dart';
import 'package:anaprampalmtc/views/Requestbooking/prayer_req_view.dart';
import 'package:flutter/material.dart';

class RequestBooking extends StatelessWidget {
  const RequestBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: themecolor,title: Text('Request Booking'),),
      body: Padding(
        padding: const EdgeInsets.all(padding * 0.5) ,
        child: ListView(
         
          children: [
             sizedboxten,
            Text("Request Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
             sizedboxten,
                     GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AuditoriumBookingScreen()));
                      },
                       child: Container(
                                     width: double.infinity,
                                     // height: 50,
                                     decoration: BoxDecoration(
                                       border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                                         borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                                         child: Padding(
                                           padding: outlinedcontainerlargepadding,
                                           child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Image(image: AssetImage('assets/requestbooking/ic_conference.png')),
                        title: Padding(
                          padding:  EdgeInsets.only(left: tilegap),
                          child: Text('Auditorium Booking',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ),
                                           ),
                                         ),
                                   ),
                     ),
        
          sizedboxten,
        
             GestureDetector(
              onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> PrayerBookingScreen()));
              },
               child: Container(
                width: double.infinity,
                // height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                    borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                    child: Padding(
                      padding:  outlinedcontainerlargepadding,
                      child: ListTile(
                      
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Image(image: AssetImage('assets/requestbooking/ic_prayer.png')),
                        title: Padding(
                          padding:  EdgeInsets.only(left: tilegap),
                          child: Text('Prayer Request',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ),
                      ),
                    ),
                       
                           ),
             ),
        
            
             sizedboxtw,
        
             Text("My Requests",style: TextStyle(fontWeight: FontWeight.bold,fontSize: textsizetwty),),
        
             sizedboxten,
        
                     GestureDetector(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AuditoriumReqViewScreen()));
                      },
                       child: Container(
                                     width: double.infinity,
                                     // height: 50,
                                     decoration: BoxDecoration(
                                       border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                                         borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                                         child: Padding(
                                           padding:  EdgeInsets.all(padding *0.5),
                                           child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Image(image: AssetImage('assets/requestbooking/ic_conference.png')),
                        title: Padding(
                          padding:  EdgeInsets.only(left: tilegap),
                          child: Text('Auditorium',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                        ),
                                           ),
                                         ),
                                   ),
                     ),
        
            sizedboxten,
        
             GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PrayerReqViewScreen()));
              },
               child: Container(
                width: double.infinity,
                // height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                    borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                    child: Padding(
                      padding:  EdgeInsets.all(padding * 0.5),
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Image(image: AssetImage('assets/requestbooking/ic_prayer.png')),
                        title: Padding(
                          padding: EdgeInsets.only(left: tilegap),
                          child: Text('Prayer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                        ),
                      ),
                    ),
                       
                           ),
             ),
        
                      sizedboxten,
        
             GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> AuditoriumCalenderScreen()));
              },
               child: Container(
                width: double.infinity,
                // height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                    borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                    child: Padding(
                      padding:  EdgeInsets.all(padding*0.5),
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        leading: Image(image: AssetImage('assets/requestbooking/calendar_home.png')),
                        title: Padding(
                          padding:  EdgeInsets.only(left: tilegap),
                          child: Text('Auditorium Calender',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                        ),
                      ),
                    ),
                       
                           ),
             ),
        
            
        
          ],
        ),
      ),
    );
  }
}