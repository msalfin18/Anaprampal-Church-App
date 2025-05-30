import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:flutter/material.dart';

class VicarMessagescreen extends StatefulWidget {

  final String vicarmessage ;

  const VicarMessagescreen({required this.vicarmessage,super.key});

  @override
  State<VicarMessagescreen> createState() => _VicarMessagescreenState();
}

class _VicarMessagescreenState extends State<VicarMessagescreen> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vicar Message'),backgroundColor: themecolor,),
      body: Center(
        child: Container(
         color: themecolor,
         child: Text(widget.vicarmessage,style: boldname,),
        ),
      ),
    );
  }
}