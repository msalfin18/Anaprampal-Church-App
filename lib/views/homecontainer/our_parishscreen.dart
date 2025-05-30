import 'package:anaprampalmtc/Constraints/background.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';

import 'package:anaprampalmtc/views/ourparish/bishopsandooficials.dart';
import 'package:anaprampalmtc/views/ourparish/evangelist_and_seminarians_home.dart';
import 'package:anaprampalmtc/views/ourparish/institutionandchapels.dart';
import 'package:anaprampalmtc/views/ourparish/kasthanasmithi.dart';
import 'package:anaprampalmtc/views/ourparish/parishhistory.dart';
import 'package:anaprampalmtc/views/ourparish/parishpriest.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';

class OurParishscreen extends StatefulWidget {
  const OurParishscreen({super.key});

  @override
  State<OurParishscreen> createState() => _OurParishscreenState();
}

class _OurParishscreenState extends State<OurParishscreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidthp = screenWidth * 0.4; // 40% of screen width
    double containerHeightp = screenHeight * 0.165; // 20% of screen height
    double imageWidth = containerWidthp * 0.6; // 60% of container width
    double imageHeight = containerHeightp * 0.5; // 60% of container height
    double normalFontSize = screenWidth * 0.04; 
    double boldFontSize = screenWidth * 0.05; 
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Parish', style: TextStyle(color: Colors.black)),
        backgroundColor: themecolor,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding * 0.5),
        child: Container(
          child: Column(
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ParishHistoryScreen()));
                    },
                    child: Container(
                      height: containerHeightp,
                      width: containerWidthp,
                      decoration: BoxDecoration(
                        border: container_border,
                        borderRadius: borderradius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ourparish/ic_church.png',
                            height: imageHeight,
                            width: imageWidth,
                          ),
                          Text("Parish", style: TextStyle(fontSize: normalFontSize)),
                          Text("History", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: padding),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChurchGroupsScreen()));
                    },
                    child: Container(
                      height: containerHeightp,
                      width: containerWidthp,
                      decoration: BoxDecoration(
                        borderRadius: borderradius,
                        border: container_border,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ourparish/ic_staffs.png',
                            height: imageHeight,
                            width: imageWidth,
                          ),
                          Text("Bishops &", style: TextStyle(fontSize: normalFontSize)),
                          Text("Official", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              sizedboxtw,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Kaisthanasmithi()));
                    },
                    child: Container(
                      height: containerHeightp,
                      width: containerWidthp,
                      decoration: BoxDecoration(
                        border: container_border,
                        borderRadius: borderradius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ourparish/ic_comittee.png',
                            height: imageHeight,
                            width: imageWidth,
                          ),
                          Text("Kaisthana", style: TextStyle(fontSize: normalFontSize)),
                          Text("Samithi", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: padding),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ParishpriestScreen()));
                    },
                    child: Container(
                      height: containerHeightp,
                      width: containerWidthp,
                      decoration: BoxDecoration(
                        borderRadius: borderradius,
                        border: container_border,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ourparish/ic_vicar.png',
                            height: imageHeight,
                            width: imageWidth,
                          ),
                          Text("Parish", style: TextStyle(fontSize: normalFontSize)),
                          Text("Priest", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              sizedboxtw,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EvangelistandseminariansHome()));
                    },
                    child: Container(
                      height: containerHeightp,
                      width: containerWidthp,
                      decoration: BoxDecoration(
                        border: container_border,
                        borderRadius: borderradius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ourparish/ic_seminar.png',
                            height: imageHeight,
                            width: imageWidth,
                          ),
                          Text("Evangilist &", style: TextStyle(fontSize: normalFontSize)),
                          Text("Semarians", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: padding),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Institutionandchapels()));
                    },
                    child: Container(
                      height: containerHeightp,
                      width: containerWidthp,
                      decoration: BoxDecoration(
                        borderRadius: borderradius,
                        border: container_border,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ourparish/ic_schedule.png',
                            height: imageHeight,
                            width: imageWidth,
                          ),
                          Text("Institutions &", style: TextStyle(fontSize: normalFontSize)),
                          Text("Chapels", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
