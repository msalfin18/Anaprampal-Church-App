import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/views/dues_payesments/duelist.dart';
import 'package:anaprampalmtc/views/dues_payesments/payduesonline.dart';
import 'package:anaprampalmtc/views/dues_payesments/paymentdetails.dart';
import 'package:flutter/material.dart';

class DueshomeScreen extends StatelessWidget {
  const DueshomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paymentdetails'),backgroundColor: themecolor,),

      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.all(padding * 0.5),
            child: Container(
              color: themecolor,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Family Name" , style: TextStyle(color: Colors.white ,fontSize: 26),),
                    Text('null' , style: TextStyle(color: Colors.black ,fontSize: 24),),
                            
                            
                    SizedBox(height: 30,),
                            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Pending Amount' , style: TextStyle(color: Colors.white ,fontSize: 26),),
                        SizedBox(width: 20,),
                        Text('0' , style: TextStyle(color: Colors.black ,fontSize: 24),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(padding * 0.5),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> DuelistScreen()));
              },
              child: Container(
                height: 60,width: double.infinity,
                child: Center(child: Text('Due List Details' , style: boldname,textAlign: TextAlign.center,)),
                color: themecolor,
              ),
            ),
          ),
          
           Padding(
             padding: const EdgeInsets.all(padding * 0.5),
             child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentdetailsScreen()));
              },
               child: Container(
                height: 60,width: double.infinity,
                child: Center(child: Text('Payment Details' , style: boldname,)),
                color: themecolor,
                         ),
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(padding * 0.5),
             child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> PaydueonlineScreen()));
              },
               child: Container(
                height: 60,width: double.infinity,
                child: Center(child: Text('Payment Dues Online' , style: boldname,)),
                color: themecolor,
                         ),
             ),
           ),
        ],
      ),
    );


  }
}