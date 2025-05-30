import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

class PrayerBookingScreen extends StatefulWidget {
  PrayerBookingScreen({super.key});

  @override
  State<PrayerBookingScreen> createState() => _PrayerBookingScreenState();
}

class _PrayerBookingScreenState extends State<PrayerBookingScreen> {

  final PrayerreqListController _prayerreqListController = PrayerreqListController();
  
  String selectedDate = "Date";

String? selectedValue = ""; 

  final _formKey = GlobalKey<FormState>();

  TextEditingController _byNameController = TextEditingController();
  TextEditingController _forNameController = TextEditingController();
  TextEditingController _contactNoController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  SharedPreferences? _readObj;
  late String _fid;

  Future<void> _loadPref() async {
    _readObj = await SharedPreferences.getInstance();
    setState(() {
      _fid = _readObj?.getString('fid') ?? "NO IP AVAILABLE";
      print("current ip is $_fid");
    });
  }

  void _prayerReq() async {
    print('start');
    var url = PRAYER_REQUEST;
    var data = {
      'fid': _fid,
      'name': _byNameController.text,
      'Fname': _forNameController.text,
      'mobile': _contactNoController.text,
      'purpose': selectedValue,
      'desc': _descriptionController.text,
      'bdate': selectedDate,
    };

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
        var jsonString = jsonData;
         successAlert();

        if (jsonString == 'success') {
          successAlert();
        }
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

  void successAlert() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListView(
                   children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: Icon(CupertinoIcons.check_mark, color: Colors.white),
              ),
              Text(
                'Booked',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'You Successfully Created Your Booking',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

                  ElevatedButton(
        
        onPressed: () {
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homescreen()));
                  
        },
        child: Text(
          'GO HOME',
          style: boldname,
        ),
        style: ButtonStyle(
         elevation: WidgetStateProperty.all(5),
          shadowColor: WidgetStateProperty.all(Colors.black),
          backgroundColor:
              MaterialStateProperty.all(themecolor), // Set the background color
        ),
      ),
            ],
          ),
        );
      },
    );
  }



    @override
  void initState() {
     _loadPref() ;
    super.initState();
    // _prayerreqListController.fetchPrayerReq().then((_) {
    //   setState(() {
    //     // Set default value if list is populated
       
    //   });
    // });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themecolor,
        title: Text('Prayer Request'),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding*0.5),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Prayer Booking Request",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              _buildDropdown(),
              sizedboxten,
              _buildTextFormField(
                controller: _byNameController,
                hint: 'Requested By Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter name';
                  } else {
                    return null;
                  }
                },
              ),
              sizedboxten,
              _buildTextFormField(
                controller: _forNameController,
                hint: 'Requested For Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter name';
                  } else {
                    return null;
                  }
                },
              ),
              sizedboxten,
              _buildTextFormField(
                controller: _contactNoController,
                hint: 'Contact No',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter mobile number';
                  } else {
                    return null;
                  }
                },
              ),
              sizedboxten,
              _buildDatePicker(),
              sizedboxten,
              _buildTextFormField(
                controller: _descriptionController,
                hint: 'Description',
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter description';
                  } else {
                    return null;
                  }
                },
              ),
              sizedboxtw,
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDropdown() {
    return Container(
      alignment: Alignment.centerRight,
      child: DropdownButtonFormField<String>(
        alignment: Alignment.centerRight,
        decoration: InputDecoration(
          border: outborder,
          errorBorder: outborder,
          enabledBorder: outborder,
          focusedBorder: outborder,
          disabledBorder: outborder,
          focusedErrorBorder: outborder,
          enabled: true,
        ),
        value: selectedValue,
        items: _prayerreqListController.prayerreqList
            .map((PrayerReqModel pryr) {
          return DropdownMenuItem<String>(
            
            child: Text(''),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
      ),
    );
  }

  TextFormField _buildTextFormField({
    required TextEditingController controller,
    required String hint,
    int? maxLines,
    TextInputType? keyboardType,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: _inputDecoration(hint),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themecolor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themecolor, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themecolor, width: 2),
      ),
      focusColor: themecolor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themecolor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themecolor, width: 2),
      ),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  Container _buildDatePicker() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: themecolor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(selectedDate, style: TextStyle(color: Colors.black)),
          ),
          IconButton(
            onPressed: () {
              showDatePickerDialog(context);
            },
            icon: Icon(CupertinoIcons.calendar, color: themecolor),
          ),
        ],
      ),
    );
  }

  void showDatePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width * 1,
            child: SfDateRangePicker(
              headerHeight: MediaQuery.of(context).size.width * 0.2,
              confirmText: 'OK',
              cancelText: 'CANCEL',
              showActionButtons: true,
              onCancel: () {
                Navigator.pop(context);
              },
              onSubmit: (Object? value) {
                if (value is DateTime) {
                  print("Selected date: $value");
                  setState(() {
                    selectedDate = DateFormat('dd-MM-yyyy').format(value);
                  });
                }
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  ElevatedButton _buildButton() {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        shadowColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.all(themecolor),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _prayerReq();
        }
      },
      child: Text(
        'REQUEST BOOKING',
        style: TextStyle(fontSize: 16 , color: Colors.black ,fontWeight: FontWeight.bold),
      ),
    );
  }
}
