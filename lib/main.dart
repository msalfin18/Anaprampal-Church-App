
import 'package:anaprampalmtc/views/ourparish/evangelist_and_seminarians_home.dart';
import 'package:anaprampalmtc/views/homecontainer/our_parishscreen.dart';
import 'package:anaprampalmtc/views/homescreen.dart';
import 'package:anaprampalmtc/views/splashhome.dart';
import 'package:anaprampalmtc/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    debugShowCheckedModeBanner: false,

     
     theme: ThemeData.light(),
  home:
  //  Splashscreen()
   
  // home:
      Homescreen()
      

      // BishopsScreen()
      // OurParishscreen()
      // ParihDirectoryScreen()
      // ChurchGroupsScreen()
      // EvangelistandseminariansHome()
    );
  


  }
}




// class MyApp extends StatelessWidget {
// const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Clean Calendar Demo',
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.system,
//       home: CalendarScreen(),
//       localizationsDelegates: GlobalMaterialLocalizations.delegates,
//       supportedLocales: [
//         const Locale('en'),
//         const Locale('fr'),
//         const Locale('de'),
//         const Locale('es'),
//         const Locale('it'),
//         const Locale('ru'),
//       ],
//     );
//   }
// }