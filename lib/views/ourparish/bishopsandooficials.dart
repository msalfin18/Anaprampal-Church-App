import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ChurchGroupsScreen extends StatefulWidget {
  @override
  _ChurchGroupsScreenState createState() => _ChurchGroupsScreenState();
}

class _ChurchGroupsScreenState extends State<ChurchGroupsScreen> {

    Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  List<dynamic> churchGroups = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchChurchGroups();
  }

  Future<void> fetchChurchGroups() async {
    final url = Uri.parse(BISHOPSANDOFFCIALS);
    try {
      final response = await http.post(
        url,
        body: {
          'loginStatus': 'true',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          churchGroups =
              data['data'] ?? []; // Update key based on API response structure
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Bishops & Officials"),
        backgroundColor: themecolor,
      ),
      body: isLoading
          ? Center(child: constcircularprogrssindicator)
          : ListView.builder(
              itemCount: churchGroups.length,
              itemBuilder: (context, index) {
                final group = churchGroups[index];
                final groupName = group['group_name'] ?? 'Unknown Group';
                final members = group['members'] as List<dynamic>? ?? [];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding * 0.5),
                  child: Card(
                        color: whitecolor,
                    shape: Border.all(style: BorderStyle.none),
                    child: ExpansionTile(
                         backgroundColor: whitecolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: themecolor, width: 2)),
                      title: Text(groupName, style: boldname,),
                      children: members.map((member) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Card(
                                  elevation: cardelevation,              
                        color: whitecolor,
                    shape: Border.all(style: BorderStyle.none),
                              child: ListTile(
                          tileColor: const Color.fromARGB(255, 236, 236, 236),
                          leading: member['photo'] != null && member['photo'].isNotEmpty
                              ? CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: NetworkImage(
                                    
                                              '$IMAGE_COMITTEE_URL${member['photo']}'),
                                  onBackgroundImageError: (_, __) {},
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                          title: Text(
                            member['name'] ?? 'Unknown Member',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(member['contact_no'] ?? 'No Contact Information'),
     
                          trailing: (member['contact_no'] != null && member['contact_no'].isNotEmpty)
                              ? IconButton(
                                  onPressed: () {
                                    _makeCall(member['contact_no']);
                                  },
                                  icon: CircleAvatar(
                                    backgroundImage: AssetImage('assets/phone.png'),
                                    radius: 15,
                                  ),
                                )
                              : null, 
                                                ),
                                              ),
                        );
                    
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
