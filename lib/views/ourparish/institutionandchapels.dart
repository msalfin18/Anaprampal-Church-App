import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/ourparish/evenglists_and_seminarians/view_institution.dart';
import 'package:flutter/material.dart';

class Institutionandchapels extends StatefulWidget {
  Institutionandchapels({super.key});

  @override
  State<Institutionandchapels> createState() => _InstitutionandchapelsState();
}

class _InstitutionandchapelsState extends State<Institutionandchapels> {
  final InstitutionandchapelsController _institutionandchapelsController =
      InstitutionandchapelsController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchinstitutionandchapels();
  }

  Future<void> fetchinstitutionandchapels() async {
    await _institutionandchapelsController.fetchinstitutionandchapels();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Text('Institutions ans Chapels'),
        backgroundColor: themecolor,
      ),
      body: _isLoading
          ? Center(child: constcircularprogrssindicator)
          : ListView.builder(
              itemCount: _institutionandchapelsController
                  .InstitutionandchapelsList.length,
              itemBuilder: (context, index) {
                InstitutionandchapelsModel institutionandchapelsModel =
                    _institutionandchapelsController
                        .InstitutionandchapelsList[index];

                return Padding(
                  padding: EdgeInsets.all(padding *0.5),
                  child: Container(
                    height: screenHeight * 0.20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: themecolor),
                      shape: BoxShape.rectangle,
                      color: whitecolor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewInstitutionScreen(
                                        image:
                                            institutionandchapelsModel.photo)));
                          },
                          child: Container(
                            height: screenHeight * 0.15,
                            width: screenWidth * 0.9,
                            child: Image.network(
                              IMAGE_INSTITUTION_URL +
                                  institutionandchapelsModel.photo,
                              // height: 0.10,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person,
                                    size: screenWidth * 0.15,
                                    color: Colors.grey);
                              },
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          color: themecolor,
                          width: double.infinity,
                          height: screenHeight * 0.04,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                institutionandchapelsModel.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );

                // Card(
                //   elevation: 2,
                //   child: ListTile(
                //     leading: Image(image: NetworkImage(IMAGE_INSTITUTION_URL+institutionandchapelsModel.photo)),

                //     tileColor: Colors.white,
                //     title: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //                  Text(institutionandchapelsModel.name),

                //       ],
                //     ),
                //   ),
                // );
              }),
    );
  }
}
