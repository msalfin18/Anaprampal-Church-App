// import 'package:anaprampalmtc/Constraints/APIs.dart';
// import 'package:anaprampalmtc/Constraints/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class AuditoriumCalenderScreen extends StatefulWidget {
//   @override
//   _AuditoriumCalenderScreenState createState() => _AuditoriumCalenderScreenState();
// }

// class _AuditoriumCalenderScreenState extends State<AuditoriumCalenderScreen> {
//   late final WebViewController _audicontroller;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the WebViewController
//     _audicontroller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(AUDITORIUM_CALENDER))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (String url) async {
//             // Delay before applying JavaScript
//             await Future.delayed(Duration(milliseconds: 0));
            
//             // Inject JavaScript for zoom fill after the delay
//             _audicontroller.runJavaScript(
//               '''
//               (function() {
//                 var metaTag = document.querySelector('meta[name="viewport"]');
//                 if (!metaTag) {
//                   metaTag = document.createElement('meta');
//                   metaTag.name = "viewport";
//                   document.head.appendChild(metaTag);
//                 }
//                 metaTag.content = "width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no";
//               })();
//               ''',
//             );
//           },
//         ),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Auditorium Calendar'),
//         backgroundColor: themecolor,
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: WebViewWidget(
//           controller: _audicontroller,
//         ),
//       ),
//     );
//   }
// }
