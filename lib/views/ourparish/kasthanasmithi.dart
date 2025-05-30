import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/background.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class Kaisthanasmithi extends StatefulWidget {
  @override
  _KaisthanasmithiState createState() => _KaisthanasmithiState();
}

class _KaisthanasmithiState extends State<Kaisthanasmithi> {
  final KaisthanasmithiController _kaisthanasmithiController = KaisthanasmithiController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchKaisthanasmithi();
  }

  Future<void> fetchKaisthanasmithi() async {
    await _kaisthanasmithiController.fetchKaisthanasmithi();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  void launchWhatsApp({required String phoneNumber}) async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunch(whatsappUrl.toString())) {
      await launch(whatsappUrl.toString());
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  void launchSMS({required String phoneNumber}) async {
    final Uri smsUrl = Uri.parse('sms:$phoneNumber');
    if (await canLaunch(smsUrl.toString())) {
      await launch(smsUrl.toString());
    } else {
      throw 'Could not launch $smsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.02;

    return Responsive(
      mobile: Scaffold(
        appBar: AppBar(title: Text('Kaisthana Samithi'), backgroundColor: themecolor),
        body: _isLoading
            ? Center(child: constcircularprogrssindicator)
            : ListView.builder(
                itemCount: _kaisthanasmithiController.KaisthanasmithiList.length,
                itemBuilder: (context, index) {
                  KaisthanasmithiModel kaisthanasmithiModel = _kaisthanasmithiController.KaisthanasmithiList[index];
      
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding  * 0.5, vertical: padding * 0.8),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: themecolor),
                              shape: BoxShape.rectangle,
                              color: whitecolor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(padding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: screenHeight * 0.10,
                                    width: screenWidth * 0.3,
                                    child: Image.network(
                                      IMAGE_KAISTHANA_SAMITHI_URL + kaisthanasmithiModel.photo,
                                      height: 0.10,
                                      fit: BoxFit.scaleDown,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.person, size: screenWidth * 0.15, color: Colors.grey);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(kaisthanasmithiModel.name, style: boldname),
                                        SizedBox(height: screenHeight * 0.005),
                                        Text('Joined: ${DateFormat('dd MMM yyyy').format(kaisthanasmithiModel.fromDate)}', style: normalname),
                                        Text('Served till: ${DateFormat('dd MMM yyyy').format(kaisthanasmithiModel.toDate)}', style: normalname),

                                         Padding(
                                           padding: EdgeInsets.symmetric(vertical :padding *0.7),
                                           child: Column(
                                                                               crossAxisAlignment: CrossAxisAlignment.end,
                                                                               children: [
                                                                                 Wrap(
                                                                                   spacing: screenWidth * 0.03,
                                                                                   children: [
                                            GestureDetector(
                                              onTap: () => _makeCall(kaisthanasmithiModel.contactNo),
                                              child: CircleAvatar(backgroundImage: AssetImage('assets/phone.png'), radius: screenWidth * 0.03),
                                            ),
                                            GestureDetector(
                                              onTap: () => launchSMS(phoneNumber: kaisthanasmithiModel.contactNo),
                                              child: CircleAvatar(backgroundImage: AssetImage('assets/sms.png'), radius: screenWidth * 0.03),
                                            ),
                                            GestureDetector(
                                              onTap: () => launchWhatsApp(phoneNumber: kaisthanasmithiModel.contactNo),
                                              child: CircleAvatar(backgroundImage: AssetImage('assets/whatsapp.png'), radius: screenWidth * 0.03),
                                            ),
                                                                                   ],
                                                                                 ),
                                                                               ],
                                                                             ),
                                         ),
                                      ],
                                    ),
                                  ),
                                 
                                ],
                              ),
                              
                            ),
                            
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: Container(
                            color: themecolor,
                            width: double.infinity,
                            height: screenHeight * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Role: ', style: boldname),
                                Text(kaisthanasmithiModel.role, style: boldname),
                              ],
                            ),
                          ),
                        ),

                        
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
