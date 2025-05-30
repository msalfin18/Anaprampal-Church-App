import 'package:flutter/material.dart';

class Fullscreenimg extends StatelessWidget {
  String image ;
   Fullscreenimg({Key? key , required this.image}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          width: double.infinity,
          image: NetworkImage(image)),
      ),
    );
  }
}