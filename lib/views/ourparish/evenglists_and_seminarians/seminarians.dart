import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/material.dart';

class SeminariansScreen extends StatefulWidget {
   SeminariansScreen({super.key});

  @override
  State<SeminariansScreen> createState() => _SeminariansScreenState();
}

class _SeminariansScreenState extends State<SeminariansScreen> {
   final SeminariansController _seminariansController = SeminariansController();

  bool _isLoading = true ;

     @override
  void initState() {
    super.initState();
    fetchSeminarians();
  }

  Future<void> fetchSeminarians() async {
    await _seminariansController.fetchSeminariance();
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
      appBar: AppBar(title: Text('Seminarians'),backgroundColor: themecolor,),

      body:  _isLoading ? Center(child: constcircularprogrssindicator)
            : ListView.builder(
        
          itemCount: _seminariansController.SeminarianstList.length,
        itemBuilder: (context , index){
            SemnariansModel semnariansModel = _seminariansController.SeminarianstList[index];

          return  Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: themecolor), // Replace with themecolor
                color: Colors.white, // Replace with whitecolor
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.3,
                          child: Image.network(
                            IMAGE_SEMINARIANS_URL+semnariansModel.photo, // Replace with the image URL
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
                                      semnariansModel.name, 
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
                                semnariansModel.address,
                                  textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: screenHeight * 0.016,
                                  color: Colors.black,
                                ),
                              ),
                             Text(
                                semnariansModel.mobile, // Replace with parishPriestModel.address
                                style: TextStyle(
                                  fontSize: screenHeight * 0.016,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          
          //  Card(
          //   elevation: 2,
          //   child: ListTile(
          //     leading: Image(image: NetworkImage(IMAGE_SEMINARIANS_URL+semnariansModel.photo)),

          //     tileColor: Colors.white,
          //     title: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
                  
          //                      Text(semnariansModel.name),
          //                  Text(semnariansModel.address),
          //                  Text(semnariansModel.mobile)
          //       ],
          //     ),
          //   ),
          // );
        }),
    );
  }
}