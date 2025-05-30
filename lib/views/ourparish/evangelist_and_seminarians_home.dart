import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/views/ourparish/evenglists_and_seminarians/evangelists.dart';
import 'package:anaprampalmtc/views/ourparish/evenglists_and_seminarians/seminarians.dart';
import 'package:flutter/material.dart';

class EvangelistandseminariansHome extends StatelessWidget {
  const EvangelistandseminariansHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Evangelits & Seminarians'),backgroundColor: themecolor,),
      body: Padding(
        padding: const EdgeInsets.all(padding * 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EvangelistsScreen()));
              },
              child: CustomListtile(title: 'Evangelists')),
            GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> SeminariansScreen()));
              },
              child: CustomListtile(title: 'Seminarians'))
          ],
        ),
      ),
    );
  }
}


class CustomListtile extends StatelessWidget {
  final String title ;
 

   CustomListtile({required this.title ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.zero, 
                    ),
                   child: ListTile(
                    title: Text(title , style: boldname,),
                   ),
                  );
  }
}