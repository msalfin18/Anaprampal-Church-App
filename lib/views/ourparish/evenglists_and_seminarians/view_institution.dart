import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:flutter/material.dart';

class ViewInstitutionScreen extends StatelessWidget {
   final String image;
   ViewInstitutionScreen({Key? key , required this.image}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          width: double.infinity,
            
          image: NetworkImage(IMAGE_INSTITUTION_URL+image)),
      ),
    );
  }
}