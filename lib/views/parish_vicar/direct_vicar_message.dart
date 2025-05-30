import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DirectVicarMessage extends StatefulWidget {
  @override
  _DirectVicarMessageState createState() => _DirectVicarMessageState();
}

class _DirectVicarMessageState extends State<DirectVicarMessage> {
  final VicarmessageController _vicarmessagecontroller = VicarmessageController();
  bool _isLoading = true;
  bool _isExpandedFirst = false; // Controls the toggle for the first card

  @override
  void initState() {
    super.initState();
    fetchvicarmessage();
  }

  Future<void> fetchvicarmessage() async {
    await _vicarmessagecontroller.fetchVicarmessage();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vicar Message'), backgroundColor: themecolor),
      body: _isLoading
          ? Center(child: constcircularprogrssindicator)
          : ListView.builder(
              itemCount: _vicarmessagecontroller.vicarmessageList.length,
              itemBuilder: (context, index) {
                VicarMessageModel vicarMessageModel = _vicarmessagecontroller.vicarmessageList[index];
                bool isFirstCard = index == 0; // Identifies the first card

                return Padding(
                  padding: EdgeInsets.all(padding * 0.5),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: themecolor,
                              ),
                              width: double.infinity,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: padding),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(vicarMessageModel.vicarName, style: boldname),
                                    Spacer(),
                                    Text(vicarMessageModel.publishDate, style: normalname),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vicarMessageModel.description,
                                    style: normalname,
                                    maxLines: isFirstCard && !_isExpandedFirst ? 5 : null,
                                    overflow: isFirstCard && !_isExpandedFirst ? TextOverflow.ellipsis : null,
                                  ),
                                  if (isFirstCard) // Show the 'Show more/less' button only for the first card
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isExpandedFirst = !_isExpandedFirst;
                                        });
                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: padding),
                                        child: Text(
                                          _isExpandedFirst ? 'Show less' : 'Show more',
                                          style: TextStyle(
                                            color: themecolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
