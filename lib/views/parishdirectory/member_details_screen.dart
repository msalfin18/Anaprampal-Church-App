import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:http/http.dart' as http;

class MemberDetailsScreen extends StatefulWidget {
  final String id;
  final String familyName;
  final String familyHead;
  final String prayerGroup;
  final String landNo;
  final String mobile1;
  final String mobile2;
  final String mailId;
  final String familyPhoto1;
  final String familyPhoto2;
  final String slab;
  final String monthlyAmount;
  final String previousDue;
  final String address;
  final String presentAddress;
  final String remark;
  final String joinDate;
  final String familyRefNo;
  final String regionFamilyName;
  final String regionFamilyHead;
  final String status;
  final String latitude;
  final String longitude;

  MemberDetailsScreen({
    Key? key,
    required this.id,
    required this.familyName,
    required this.familyHead,
    required this.prayerGroup,
    required this.landNo,
    required this.mobile1,
    required this.mobile2,
    required this.mailId,
    required this.familyPhoto1,
    required this.familyPhoto2,
    required this.slab,
    required this.monthlyAmount,
    required this.previousDue,
    required this.address,
    required this.presentAddress,
    required this.remark,
    required this.joinDate,
    required this.familyRefNo,
    required this.regionFamilyName,
    required this.regionFamilyHead,
    required this.status,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<MemberDetailsScreen> createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  bool _memberVisible = false;
  bool _bloodVisible = false;

  List<dynamic> jsonUserData = []; // Store family members data

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _fetchFamilyData());
  }

  void _fetchFamilyData() async {
    var url =
        "https://qahalpro.com/anaprampalmtc/API/api.php?function=family_all";
    var data = {'family_id': widget.id};

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Fetching family data...')),
    // );

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: data,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print('Full JSON data: $jsonData');

        if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
          jsonUserData = jsonData['data'][0]['members'] ?? [];
        } else {
          jsonUserData = [];
        }

        print('Fetched family members: $jsonUserData');

        if (jsonUserData.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No family members found for this family')),
          );
        }

        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: $error')),
      );
    }
  }

  Future<void> _call(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Could not launch phone dialer')), // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Location coordinates are missing')),
        // );
      );
    }
  }

  Future<void> _callland(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Could not launch phone dialer')), // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Location coordinates are missing')),
        // );
      );
    }
  }

  Future<void> openMap(String latitude, String longitude) async {
    final googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    // Check if the URL can be launched.
    if (await canLaunch(googleMapsUrl)) {
      // Launch the URL.
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

//............................................................................................................................................//

///////////  this is the open map fuction this is commnted bcs the lat log is empty in the data base

  // Future<void> openMap(String latitude, String longitude) async {
  //   if (latitude.isEmpty || longitude.isEmpty) {

  //   final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=kerala';

  //     return;
  //   }

  //   try {
  //     final double lat = double.parse(latitude);
  //     final double lon = double.parse(longitude);
  //     final Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');

  //     if (await canLaunchUrl(googleUrl)) {
  //       await launchUrl(googleUrl);
  //     } else {
  //       throw 'Could not launch $googleUrl';
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Invalid format for location coordinates')),
  //     );
  //     print('Error: $e');
  //   }
  // }
//............................................................................................................................................//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        title: Text('Member Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding * 0.5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.familyPhoto1 != null && widget.familyPhoto1.isNotEmpty
                  ? Image(
                      height: imageheight,
                      image: NetworkImage(FAMIMG + widget.familyPhoto1),
                      width: double.infinity,
                      alignment: Alignment.center,
                    )
                  : Icon(
                      Icons.people,
                      size: imageheight,
                      color: Colors.grey,
                    ),

              // Family Name
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
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
                        SizedBox(width: textsizedboxisncnd * 0.5),
                        Expanded(child: Text(widget.familyName)),
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),
              // Address

              /////////////////////
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListTile(
                    tileColor: Colors.grey[300],
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: textsizedboxifist, child: Text("Address")),
                          SizedBox(width: textsizedboxisncnd),
                          Text(":"),
                          SizedBox(width: textsizedboxisncnd * 0.5),
                          Expanded(child: Text(widget.address)),
                          IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              openMap(widget.latitude, widget.longitude);
                            },
                            icon: CircleAvatar(
                                child: Image.asset(
                                    'assets/familydetail/map_icon.png')),
                          ),
                         /////////////////////////////////////////////////////////////
                        ],
                      ),
                    ),
                  
                  ),
                ),
              ),

              ///
              // Mobile 1
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: 50,
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: textsizedboxifist, child: Text("Mobile")),
                        SizedBox(width: textsizedboxisncnd),
                        Text(":"),
                        SizedBox(width: textsizedboxisncnd * 0.5),
                        Expanded(child: Text(widget.mobile1)),
                        CircleAvatar(
                          maxRadius: iconsize,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                _call(widget.mobile1.isNotEmpty
                                    ? '+91${widget.mobile1}'
                                    : '');
                              },
                              icon:
                                  Image.asset('assets/familydetail/phone.png')),
                        ),
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),
              // Landline
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: listtileheight,
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: textsizedboxifist, child: Text("LandLine")),
                        SizedBox(width: textsizedboxisncnd),
                        Text(":"),
                        SizedBox(width: textsizedboxisncnd * 0.5),
                        Expanded(
                          child: Text(
                            widget.landNo.isNotEmpty
                                ? widget.landNo
                                : widget.mobile2 ?? "",
                          ),
                        ),
                        CircleAvatar(
                          maxRadius: iconsize,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                _callland(
                                  widget.landNo.isNotEmpty
                                      ? widget.landNo
                                      : widget.mobile2 ?? "",
                                );
                              },
                              icon:
                                  Image.asset('assets/familydetail/phone.png')),
                        )
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),
              // Email
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: listtileheight,
                  child: ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: textsizedboxifist, child: Text("Email ID")),
                        SizedBox(width: textsizedboxisncnd),
                        Text(":"),
                        SizedBox(width: textsizedboxisncnd * 0.5),
                        Expanded(child: Text(widget.mailId)),
                      ],
                    ),
                    tileColor: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Family Members
              //...................................
              ListTile(
                tileColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.people),
                      backgroundColor: Colors.white,
                    ),
                    Text(
                      'Family Members',
                      style: TextStyle(color: themecolor),
                    ),
                    Spacer(),
                  ],
                ),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: () {
                  setState(() {
                    _memberVisible = !_memberVisible;
                  });
                },
              ),
              if (_memberVisible)
                ListView.builder(
                  itemCount: jsonUserData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var member = jsonUserData[index];
                    return ListTile(
                      tileColor: Colors.grey[100],
                      title: Row(
                        children: [
                          SizedBox(
                              width: textsizedboxifist,
                              child: Text(member['relation'] ?? '')),
                          SizedBox(
                            width: textsizedboxisncnd,
                          ),
                          Text(':'),
                          SizedBox(width: textsizedboxisncnd * 0.5),
                          Expanded(
                              child: Text(
                            member['name'],
                            textAlign: TextAlign.start,
                          )),
                        ],
                      ),
                    );
                  },
                ),

              //...............................................................................
              SizedBox(
                height: 5,
              ),

              ListTile(
                tileColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.bloodtype),
                      backgroundColor: Colors.white,
                    ),
                    Text(
                      'Blood Group',
                      style: TextStyle(color: themecolor),
                    ),
                    Spacer(),
                  ],
                ),
                trailing: Icon(Icons.arrow_drop_down),
                onTap: () {
                  setState(() {
                    _bloodVisible = !_bloodVisible;
                  });
                },
              ),
              if (_bloodVisible)
                ListView.builder(
                  itemCount: jsonUserData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var member = jsonUserData[index];
                    return ListTile(
                      tileColor: Colors.grey[300],
                      title: Row(
                        children: [
                          SizedBox(
                              width:
                                  textsizedboxifist + textsizedboxifist * 0.5,
                              child: Text(member['name'] ?? '')),
                          SizedBox(
                            width: textsizedboxisncnd,
                          ),
                          Text(':'),
                          SizedBox(width: textsizedboxisncnd),
                          Expanded(
                              child: Text(
                            member['blood_group'],
                            textAlign: TextAlign.start,
                          )),
                        ],
                      ),
                    );
                  },
                ),
              sizedboxtw
            ],
          ),
        ),
      ),
    );
  }
}
