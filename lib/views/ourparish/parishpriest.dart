import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/material.dart';

class ParishpriestScreen extends StatefulWidget {
  ParishpriestScreen({super.key});

  @override
  State<ParishpriestScreen> createState() => _ParishpriestScreenState();
}

class _ParishpriestScreenState extends State<ParishpriestScreen> {
  final ParishPriestController _parishPriestController = ParishPriestController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchpa();
  }

  Future<void> fetchpa() async {
    await _parishPriestController.fetchParishPriest();
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
        title: Text("Parish Priest"),
        backgroundColor: themecolor,
      ),
      body: _isLoading
          ? Center(child: constcircularprogrssindicator)
          : ListView.builder(
              itemCount: _parishPriestController.ParishPriestList.length,
              itemBuilder: (context, index) {
                ParishPriestModel parishPriestModel = _parishPriestController.ParishPriestList[index];
                return Padding(
                  padding: EdgeInsets.all(padding *0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: themecolor),
                      shape: BoxShape.rectangle,
                      color: whitecolor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: screenHeight * 0.12,
                              width: screenWidth * 0.3,
                              child: Image.network(
                                '${IMAGE_VICAR_URL}${parishPriestModel.parishPriestPhoto}',
                                fit: BoxFit.fitHeight,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.person,
                                    size: screenWidth * 0.15,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: padding),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: themecolor,
                                          width: double.infinity,
                                          height: screenHeight * 0.05,
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(padding),
                                              child: Text(
                                                parishPriestModel.parishPriestName,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: screenHeight * 0.018,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                                        Text(
                                          parishPriestModel.address,
                                          style: TextStyle(
                                            fontSize: screenHeight * 0.016,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
