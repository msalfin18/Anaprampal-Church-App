import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/views/parish_vicar/direct_vicar_message.dart';
import 'package:anaprampalmtc/views/parish_vicar/former_vicar.dart';
import 'package:anaprampalmtc/views/parish_vicar/parish_rogram.dart';
import 'package:anaprampalmtc/views/parish_vicar/present_vicar.dart';
import 'package:flutter/material.dart';
class ParishVicarscreen extends StatelessWidget {
  const ParishVicarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Responsive dimensions
    double containerHeight = screenHeight * 0.165; // 20% of screen height
    double containerWidth = screenWidth * 0.4;  // 40% of screen width
    double imageHeight = containerHeight * 0.5; // 50% of container height
    double imageWidth = containerWidth * 0.6;  
        double normalFontSize = screenWidth * 0.04; 
    double boldFontSize = screenWidth * 0.05; 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Parish Vicar"),
        backgroundColor: themecolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding * 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PresentVicarScreen()),
                    );
                  },
                  child: Container(
                    height: containerHeight,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      border: container_border,
                      borderRadius: borderradius,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/ourparish/ic_vicar.png'),
                          height: imageHeight,
                          width: imageWidth,
                        ),
                         Text("Present", style: TextStyle(fontSize: normalFontSize)),
                         Text("Vicar", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormerVicarScreen()),
                    );
                  },
                  child: Container(
                    height: containerHeight,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      border: container_border,
                      borderRadius: borderradius,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/parishvicar/ic_previousvicar.png'),
                          height: imageHeight,
                          width: imageWidth,
                        ),
                         Text("Former", style: TextStyle(fontSize: normalFontSize)),
                         Text("Vicars", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DirectVicarMessage()),
                    );
                  },
                  child: Container(
                    height: containerHeight,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      border: container_border,
                      borderRadius: borderradius,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/parishvicar/ic_message.png'),
                          height: imageHeight,
                          width: imageWidth,
                        ),
                        Text("Vicar", style: TextStyle(fontSize: normalFontSize)),
                        Text("Message", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ParishProgramScreen()),
                    // );
                  },
                  child: Container(
                    height: containerHeight,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      border: container_border,
                      borderRadius: borderradius,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/parishvicar/ic_schedule.png'),
                          height: imageHeight,
                          width: imageWidth,
                        ),
                         Text("Parish", style: TextStyle(fontSize: normalFontSize)),
                         Text("Program", style: TextStyle(fontSize: boldFontSize, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
