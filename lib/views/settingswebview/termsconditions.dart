// import 'package:anaprampalmtc/Constraints/APIs.dart';
// import 'package:anaprampalmtc/Constraints/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';


// class TermsconditionsScreen extends StatefulWidget {
//   @override
//   _TermsconditionsScreenState createState() => _TermsconditionsScreenState();
// }

// class _TermsconditionsScreenState extends State<TermsconditionsScreen> {


//    late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the WebViewController
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(TERMSANDCONDITIONS)); 
//   }
//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Terms Conditions'),backgroundColor: themecolor,),
//       body: 
      
//       WebViewWidget(
//         controller: _controller,
//       )
      
//       );
     
//   }
// }


import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart' show themecolor;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsconditionsScreen extends StatefulWidget {
  @override
  _TermsconditionsScreenState createState() => _TermsconditionsScreenState();
}

class _TermsconditionsScreenState extends State<TermsconditionsScreen> {
  late WebViewController _controller;

  bool _isLoading = true;

  Future<void> _loadpref() async {



      setState(() {
  
      });

      // Load the WebView after it's initialized
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.loadRequest(Uri.parse(TERMSANDCONDITIONS));
      });
  
  }

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          setState(() {
            _isLoading = false; // Hide loader when page loads
          });
        },
        onWebResourceError: (error) {
          print("WebView error: ${error.description}");
        },
      ));

    _loadpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        title: Text('Terms & Conditions'),),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) Center(child: constcircularprogrssindicator),
        ],
      ),
    );
  }
}
