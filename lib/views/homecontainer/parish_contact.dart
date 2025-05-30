import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ParishcontactScreen extends StatefulWidget {
  const ParishcontactScreen({super.key});

  @override
  State<ParishcontactScreen> createState() => _ParishcontactScreenState();
}

class _ParishcontactScreenState extends State<ParishcontactScreen> {
  ParishContactController _parishContactController = ParishContactController();

  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchcontact();
  }

  Future<void> fetchcontact() async {
    await _parishContactController.fetchchparishcontact();
    setState(() {
      _isLoading = false;
    });
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

  Future<void> openMap(
    String location,
  ) async {
    final googleMapsUrl = location;

    // Check if the URL can be launched.
    if (await canLaunch(googleMapsUrl)) {
      // Launch the URL.
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  Future<void> opensite() async {
    final Uri website =
        Uri.parse('https://anaprampalmtc.com/anapara/index.php');

    // Check if the URL can be launched.
    if (await canLaunchUrl(website)) {
      // Launch the URL.
      await launchUrl(
        website,
        mode: LaunchMode
            .externalApplication, // Ensures the site opens in the browser.
      );
    } else {
      throw Exception('Could not launch $website');
    }
  }

  Future<void> openmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'anaprampalmtc@gmail.com',
      query: 'subject=${Uri.encodeComponent('')}',
    );

    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          backgroundColor: themecolor,
        ),
        body: _isLoading
            ? constcircularprogrssindicator
            : ListView.builder(
                itemCount: _parishContactController.parishcontactList.length,
                itemBuilder: (context, index) {
                  ParishContactModel parishpriestModel =
                      _parishContactController.parishcontactList[index];

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: padding * 0.5),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: whitecolor,
                              shape: Border.all(style: BorderStyle.none),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        color: whitecolor,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: padding),
                                          child: Text(
                                            'Church Address',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: themecolor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Card(
                                        color: whitecolor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: padding),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                parishpriestModel.churchName,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                parishpriestModel.address,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 2,
                                color: whitecolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: padding),
                                    child: ListTile(
                                      leading: Text(
                                        'phone',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                      title: Text(parishpriestModel.mobile1),
                                      trailing: IconButton(
                                        onPressed: () {
                                          _callland(parishpriestModel.mobile1);
                                        },
                                        icon: CircleAvatar(
                                            maxRadius: 15,
                                            child: Image.asset(
                                                'assets/phone.png')),
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: whitecolor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: padding),
                                    child: ListTile(
                                      leading: Text(
                                        'phone',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                      title: Text(parishpriestModel.mobile2),
                                      trailing: IconButton(
                                        onPressed: () {
                                          _callland(parishpriestModel.mobile2);
                                        },
                                        icon: CircleAvatar(
                                            maxRadius: 15,
                                            child: Image.asset(
                                                'assets/phone.png')),
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: whitecolor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: padding),
                                    child: ListTile(
                                      leading: Text(
                                        'website',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                      title: Text(parishpriestModel.webUrl),
                                      trailing: IconButton(
                                          onPressed: () {
                                            opensite();
                                          },
                                          icon: CircleAvatar(
                                              maxRadius: 15,
                                              child: Image.asset(
                                                  'assets/contact/website.png'))),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: whitecolor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: padding),
                                    child: ListTile(
                                      leading: Text(
                                        'Email',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                      title: Text(parishpriestModel.mailId),
                                      trailing: IconButton(
                                          onPressed: () {
                                            openmail();
                                          },
                                          icon: CircleAvatar(
                                              maxRadius: 15,
                                              child: Image.asset(
                                                  'assets/contact/email.png'))),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: whitecolor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: padding),
                                    child: ListTile(
                                      leading: Text(
                                        'Location',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 14),
                                      ),
                                      title: Text(parishpriestModel.mobile2),
                                      trailing: IconButton(
                                        onPressed: () {
                                          openMap(parishpriestModel.location);
                                        },
                                        icon: CircleAvatar(
                                            maxRadius: 15,
                                            child: Image.asset(
                                                'assets/familydetail/map_icon.png')),
                                      ),
                                    )),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              color: whitecolor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      color: whitecolor,
                                    
                                    
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: padding),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                                height: 60,
                                                image: AssetImage(
                                                    'assets/gallery/churchtimeicon.jpg')),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              'Church Timings',
                                              style: TextStyle(
                                                  color: themecolor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      color: whitecolor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: padding),
                                        child: Column(
                                          children: parishpriestModel.time
                                              .map((timeItem) {
                                            return ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0),
                                              leading: Text(
                                                timeItem.title,
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 12),
                                              ),
                                              title: Text(
                                                timeItem.timing,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  );
                }));
  }
}
