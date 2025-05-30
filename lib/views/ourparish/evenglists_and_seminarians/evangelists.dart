import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/material.dart';

class EvangelistsScreen extends StatefulWidget {
   EvangelistsScreen({super.key});

  @override
  State<EvangelistsScreen> createState() => _EvangelistsScreenState();
}

class _EvangelistsScreenState extends State<EvangelistsScreen> {
   final EvenglistController _evenglistController = EvenglistController();

  bool _isLoading = true ;

     @override
  void initState() {
    super.initState();
    fetchevengelist();
  }

  Future<void> fetchevengelist() async {
    await _evenglistController.fetchevengelist();
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

      
      appBar: AppBar(title: Text('Evangelists'),backgroundColor: themecolor,),

      body:  _isLoading ? Center(child: constcircularprogrssindicator)
            : ListView.builder(
        
          itemCount: _evenglistController.EvangelisttList.length,
        itemBuilder: (context , index){
            EvangelistModel evangelistModel = _evenglistController.EvangelisttList[index];

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: themecolor), // Replace with themecolor
                color: Colors.white, // Replace with whitecolor
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
                         IMAGE_SEMINARIANS_URL+evangelistModel.photo , // Replace with the image URL
                             fit: BoxFit.scaleDown,
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
                            Container(
                              color: themecolor, // Replace with themecolor
                              width: double.infinity,
                              height: screenHeight * 0.05,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(padding),
                                  child: Text(
                                 '${evangelistModel.name}', // Replace with parishPriestModel.parishPriestName
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
                            Row(
                              children: [

                                 Text(
                                 'Mobile : ', // Replace with parishPriestModel.address
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.016,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                 evangelistModel.mobile, // Replace with parishPriestModel.address
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.016,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
          

        }),
    );
  }
}