import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BdayfamviewScreen extends StatefulWidget {
  final String id;

  BdayfamviewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<BdayfamviewScreen> createState() => _BdayfamviewScreenState();
}

class _BdayfamviewScreenState extends State<BdayfamviewScreen> {
  List<dynamic> jsonUserData = [];
  List<dynamic> jsonfamily = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFamilyData();
  }

  void _fetchFamilyData() async {
    var url =
        "https://qahalpro.com/anaprampalmtc/API/api.php?function=family_all";
    var data = {'family_id': widget.id};

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
          jsonfamily = jsonData['data'];
          jsonUserData = jsonData['data'][0]['members'] ?? [];
        } else {
          jsonfamily = [];
          jsonUserData = [];
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: $error')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _call(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch phone dialer')),
      );
    }
  }

  Future<void> openMap(String latitude, String longitude) async {
    if (latitude.isEmpty || longitude.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location coordinates are missing')),
      );
      return;
    }
    final googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open Google Maps')),
      );
    }
  }
  Future<void> _callland(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch phone dialer')), // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Location coordinates are missing')),
      // );
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor, // Replace with `themecolor`
        title: Text('Member Details'),
      ),
      body: isLoading
          ? Center(child: constcircularprogrssindicator)
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: jsonfamily.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var family in jsonfamily)
                          Column(
                            children: [
                              if (family['family_photo_1'] != null &&
                                  family['family_photo_1'].isNotEmpty)
                                Image.network(
                                  '$FAMIMG${family['family_photo_1']}',
                                  height: imageheight,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              SizedBox(height: 10),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 2),
                              //   child: SizedBox(
                              //     height: listtileheight,
                              //     child: ListTile(
                              //       title: Text(
                              //           "House Name: ${family['family_name'] ?? 'N/A'}"),

                              //       trailing: IconButton(
                              //         icon: Icon(Icons.map),
                              //         onPressed: () {
                              //           openMap(family['latitude'] ?? '',
                              //               family['Longitude'] ?? '');
                              //         },
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: SizedBox(
                                  height: listtileheight,
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        SizedBox(
                                            width: textsizedboxifist,
                                            child: Text("House Name")),
                                        SizedBox(width: textsizedboxisncnd),
                                        Text(":"),
                                        SizedBox(
                                            width: textsizedboxisncnd * 0.5),
                                        Expanded(
                                            child: Text(
                                                family['family_name'] ?? '')),
                                      ],
                                    ),
                                    tileColor: Colors.grey[300],
                                  ),
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: SizedBox(
                                  height: listtileheight,
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        SizedBox(
                                            width: textsizedboxifist,
                                            child: Text("Address")),
                                        SizedBox(width: textsizedboxisncnd),
                                        Text(":"),
                                        SizedBox(
                                            width: textsizedboxisncnd * 0.5),
                                        Expanded(
                                          child: Text(
                                              "${family['address'] ?? 'N/A'}"),
                                        ),
                                        IconButton(
                            onPressed: () {
                              openMap(family['latitude'], family['longitude']);
                            },
                            icon: CircleAvatar(
                              child: Image.asset('assets/familydetail/map_icon.png')
                            ),
                          ),
                                      ],
                                    ),
                                    tileColor: Colors.grey[300],
                                  ),
                                  
                                ),
                              ),

                                   Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: 50,
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(width: textsizedboxifist, child: Text("Mobile")),
                        SizedBox(width: textsizedboxisncnd),
                        Text(":"),
                        SizedBox(width: textsizedboxisncnd*0.5),
                        Expanded(child: Text(family['mobile_1'] ?? 'N/A')),
                        CircleAvatar(
                          maxRadius: iconsize,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              _call(family['mobile_1'] ?? ' '.isNotEmpty ? '+91${family['mobile_1']}' : '');
                            },
                            icon: Image.asset('assets/familydetail/phone.png')
                          ),
                        ),
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),


                         Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: listtileheight,
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(width: textsizedboxifist, child: Text("LandLine")),
                        SizedBox(width: textsizedboxisncnd),
                        Text(":"),
                        SizedBox(width: textsizedboxisncnd*0.5),
                      Expanded(
                       child: Text(family['land_no'].isNotEmpty ? family['land_no'] : family['land_no']?? "",),),
        
                         CircleAvatar(
                          maxRadius: iconsize,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              _callland(family['land_no'].isNotEmpty ?family['land_no']: family['land_no'] ?? "",);
                            },
                            icon: Image.asset('assets/familydetail/phone.png')
                          ),
                         )
                       
        
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),

            Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: listtileheight,
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(width: textsizedboxifist, child: Text("Email ID")),
                        SizedBox(width: textsizedboxisncnd),
                        Text(":"),
                        SizedBox(width: textsizedboxisncnd*0.5),
                        Expanded(child: Text(family['mail_id'] ?? 'N/A')),
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 5),

                            ],
                          ),
                        Divider(),
                        Text("Family Members",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: jsonUserData.length,
                          itemBuilder: (context, index) {
                            var member = jsonUserData[index];
                            return ListTile(
                              title: Text(
                                  "${member['name']} (${member['relation']})"),
                              subtitle: Text("DOB: ${member['date_of_birth']}"),
                            );
                          },
                        ),
                      ],
                    )
                  : Center(child: Text('No family data found')),
            ),
    );
  }
}
