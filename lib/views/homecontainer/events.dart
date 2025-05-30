import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/views/birthdayfamilyview.dart';
import 'package:anaprampalmtc/views/parishdirectory/member_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final BirthdayController _controller = BirthdayController();
  final Map<DateTime, List<Map<String, String>>> _events = {};
  List<Map<String, String>> _selectedEvents = [];
  DateTime _selectedDay = DateTime.now();
  late String id ;

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
void initState() {
  super.initState();
  _selectedDay = DateTime.now(); // Ensure _selectedDay is today's date
  _fetchData();

  Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Internet is Too slow please wait for some time...' , style: normalname,),
            duration: Duration(seconds: 2),
            backgroundColor: themecolor,
          ),
        );

      }
  }
  );
}

Future<void> _fetchData() async {
  await _controller.fetchBirthdays();
  _populateEvents();
  _updateSelectedEvents(); // Update _selectedEvents with today's events
  setState(() {});
}

void _populateEvents() {
  for (var birthday in _controller.birthdayList) {
    if (birthday.bdate != null) {
      final bkey = DateTime(
        DateTime.now().year,
        DateTime.parse(birthday.bdate.toString()).month,
        DateTime.parse(birthday.bdate.toString()).day,
      );
      _events.putIfAbsent(bkey, () => []).add({
        'type': 'Birthday',
        'name': birthday.name,
        'fname': birthday.fname ?? 'N/A',
        'mobileNumber': birthday.mobile ?? '7300',
        'id': birthday.id ?? '',
      });
    }

    if (birthday.anndate != null && birthday.anndate != '0000-00-00') {
      final akey = DateTime(
        DateTime.now().year,
        DateTime.parse(birthday.anndate.toString()).month,
        DateTime.parse(birthday.anndate.toString()).day,
      );
      _events.putIfAbsent(akey, () => []).add({
        'type': 'Anniversary',
        'aname': birthday.aname,
        'fname': birthday.fname ?? 'N/A',
        'mobileNumber': birthday.mobile ?? '7300',
        'id': birthday.id ?? '',
      });
    }
  }
}

void _updateSelectedEvents() {
  final todayKey = DateTime(DateTime.now().year, _selectedDay.month, _selectedDay.day);
  _selectedEvents = _events[todayKey] ?? [];
}

@override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
    appBar: AppBar(
      backgroundColor: themecolor,
      title: Text('Birthdays & Anniversaries'),
    ),
    body: _controller.birthdayList.isEmpty
        ? Center(child: constcircularprogrssindicator)
        : Padding(
            padding: const EdgeInsets.all(padding *0.5),
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2000),
                  lastDay: DateTime.utc(2100),
                  focusedDay: _selectedDay,
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                  eventLoader: (day) {
                    final key = DateTime(DateTime.now().year, day.month, day.day);
                    return _events[key] ?? [];
                  },
                  pageJumpingEnabled: true,
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    decoration: BoxDecoration(color: themecolor),
                  ),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    todayTextStyle: TextStyle(
                      color: Colors.white
                    ),
                    markersMaxCount: 0,
                    markerDecoration: BoxDecoration(
                      shape: BoxShape.circle,

                           color: Colors.indigo),
                    todayDecoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                   
                    ),
                    selectedTextStyle: TextStyle(color: Colors.black),
                    selectedDecoration: BoxDecoration(
                      color: const Color.fromARGB(255, 177, 108, 255),
                      shape: BoxShape.circle,
                         border: Border.all(width: 2 ,color: themecolor , strokeAlign: 1 , style: BorderStyle.solid)
                    ),
                    defaultDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    weekendDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    outsideDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      final key = DateTime(DateTime.now().year, day.month, day.day);

                      if (isSameDay(day, DateTime.now())) {
                        return Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      if (_events[key]?.isNotEmpty ?? false) {
                        return Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: themecolor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      return null;
                    },
                  ),////
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _updateSelectedEvents();
                    });
                  },
                ),
                const SizedBox(height: 20),
          Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,

      //   children: [
      //           Text(
      //   'Selected Date:',
      //   style: TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      // SizedBox(width: 10,),
      // Text(
      //   '${_selectedDay.day}-${_selectedDay.month}-${_selectedDay.year}',
      //   style: TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.bold,
      //     color: themecolor,
      //   ),
      // ),

      //   ],
      // ),
      const SizedBox(height: 10), // Add spacing between the text and the ListView
      _selectedEvents.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: _selectedEvents.length,
                itemBuilder: (context, index) {
                  final event = _selectedEvents[index];
                  return GestureDetector(
                    onTap: () {
                      id = event['id'].toString();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BdayfamviewScreen(id: id),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 130,
                      child: Card(
                        color: whitecolor,
                        shape: Border.all(style: BorderStyle.none),
                        child: Center(
                          child: ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            title: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: event['type'] == 'Birthday'
                                        ? 'Birthday: '
                                        : 'Anniversary: ',
                                    style: TextStyle(
                                      color: event['type'] == 'Birthday'
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: event['type'] == 'Birthday'
                                        ? event['name']
                                        : event['aname'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Text('${event['fname']}'),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Wrap(
                                  spacing: screenWidth * 0.03,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        final phoneNumber =
                                            event['mobileNumber'] ?? '00';
                                        _makeCall(phoneNumber);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/phone.png'),
                                        radius: screenWidth * 0.035,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        final phoneNumber =
                                            event['mobileNumber'] ?? '00';
                                        launchSMS(phoneNumber: phoneNumber);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/sms.png'),
                                        radius: screenWidth * 0.035,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        final phoneNumber =
                                            event['mobileNumber'] ?? '00';
                                        launchWhatsApp(phoneNumber: phoneNumber);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/whatsapp.png'),
                                        radius: screenWidth * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Expanded(
              child: Center(child: Text('No events for today')),
            ),
    ],
  ),
),


              ],
            ),
          ),
  );
}
}
