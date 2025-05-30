
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/views/fam_idscreen.dart';
import 'package:anaprampalmtc/views/homecontainer/parish_contact.dart';
import 'package:anaprampalmtc/views/ourparish/bishopsandooficials.dart';
import 'package:anaprampalmtc/views/ourparish/parishhistory.dart';
import 'package:flutter/material.dart';

class Splashhome extends StatelessWidget {
   Splashhome({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/home_icon.jpg'))
        ),
      child: Padding(
        padding: const EdgeInsets.all(padding + 12),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Spacer(),
            
            Text("Welcome to",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 20)),
             
            Text("Anaprampal",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),),
            Text("Mar Thoma Church",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),),
            
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, 
            
            MaterialPageRoute(builder: (context)=> FamIdscreen()));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: themecolor,
             backgroundColor: Colors.transparent, // Text color when pressed
            shadowColor: Colors.transparent, // Remove shadow
            elevation: 0, // Flat button with no elevation
            side: BorderSide(color: Colors.white, width: 2), // White border
            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Curved edges
            ),
          ),
          child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold , fontSize: 20),),
        ),
        Spacer(),
        Spacer(),
        Spacer(),
        Card(
            elevation: 0,
            color: Colors.white,child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Quick Links",style: TextStyle(fontSize: 15,)),
          ),),
          SizedBox(height: 15,),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChurchGroupsScreen()));
                    },
                    child: Container(
                     height: 70,width: 70,          
                      child: Image(image: AssetImage('assets/ic_officials_white.png'))
                        
                      ),
                  ), 
                    Text("parish",style: TextStyle(color: Colors.black,fontSize: 10),),
                    Text("Offial",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
          
              Column(
                children: [
                  GestureDetector(

                    onTap: (){
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ParishHistoryScreen()));
                 
                    },
                    child: Container(
                     height: 70,width: 70,          
                      child: Image(image: AssetImage('assets/ic_history_white.png'))
                        
                      ),
                  ), 
                    Text("parish",style: TextStyle(color: Colors.black,fontSize: 10),),
                    Text("History",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
        
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> ParishcontactScreen()));
                 
                    },
                    child: Container(
                     height: 70,width: 70,          
                      child: Image(image: AssetImage('assets/ic_contact_white.png'))
                        
                      ),
                  ), 
                    Text("parish",style: TextStyle(color: Colors.black,fontSize: 10),),
                    Text("Contact",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
        
            ],
          )
          ],
        ),
        SizedBox(height: 10,)
          ],
        ),
      ),
      ),
    );
  }
}