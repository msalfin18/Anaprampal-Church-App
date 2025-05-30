// import 'package:anaprampalmtc/Constraints/appbar.dart';
// import 'package:anaprampalmtc/Constraints/colors.dart';
// import 'package:anaprampalmtc/Constraints/constands.dart';
// import 'package:anaprampalmtc/views/homescreen.dart';
// import 'package:anaprampalmtc/views/splashhome.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class Splashscreen extends StatefulWidget {
//   Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   String isLoggedIn = 'false';
//   bool loginStatus = false;
//   bool hasInternet = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _checkLoginStatus();
//     _checkInternet();
//   }

//   _checkInternet() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       setState(() {
//         hasInternet = false;
//       });
//     } else {
//       setState(() {
//         hasInternet = true;
//       });
//     }
//   }

//   Future<void> _checkLoginStatus() async {
//     print(isLoggedIn);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       isLoggedIn = prefs.getString('isLoggedIn') ?? 'false';
//       print('inside $isLoggedIn');

//       if (isLoggedIn == 'true') {
//         loginStatus = true;
//       } else {
//         loginStatus = false;
//       }
//     });

//     Future.delayed(Duration(seconds: 2), () {
//       var pushReplacement = Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => loginStatus ? Homescreen() : Splashhome()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//         body: hasInternet
//             ? Padding(
//                 padding: const EdgeInsets.all(padding),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 200,
//                         width: 200,
//                         child: Image.asset("assets/qahalpro_icon.png"),
//                       ),
//                       constcircularprogrssindicator
//                     ],
//                   ),
//                 ),
//               )
//             : Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.wifi_off, size: 100, color: Colors.grey),
//                     SizedBox(height: 20),
//                     Text(
//                       'No Internet Connection',
//                       style: TextStyle(fontSize: 24, color: Colors.black),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           themecolor,
//                         ),
//                         minimumSize: MaterialStateProperty.all<Size>(
//                           Size(
//                             size.width * 0.4,
//                             size.height * 0.06,
//                           ),
//                         ),
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(18.0),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         _checkInternet(); // Call the method to recheck the connection
//                       },
//                       child: Text('Retry'),
//                     ),
//                   ],
//                 ),
//               ));
//   }
// }
