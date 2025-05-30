import 'dart:convert';

import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class AuditoriumBookingScreen extends StatefulWidget {
  AuditoriumBookingScreen({super.key});

  @override
  State<AuditoriumBookingScreen> createState() =>
      _AuditoriumBookingScreenState();
}

class _AuditoriumBookingScreenState extends State<AuditoriumBookingScreen> {

  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();
  TextEditingController _mobilecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _purposecontroller = TextEditingController();

  String selcteddate = "Date";
  String selctedtime = "Time";

    final _formkey = GlobalKey<FormState>();

  final AuditoriumListController _auditoriumListcontroller =
      AuditoriumListController();

  String? selectedAuditorium;
  SharedPreferences ? _readobj ;
  late String _fid ;

  @override
  void initState() {
    _loadpref();
    super.initState();
    _auditoriumListcontroller.fetchauditorium().then((_) {
      setState(() {
        // Set default value if list is populated
        if (_auditoriumListcontroller.auditoriumList.isNotEmpty) {
          selectedAuditorium = _auditoriumListcontroller.auditoriumList[0].name;
        }
      });
    });

    
  }


  Future<void>_loadpref()async{
             _readobj = await SharedPreferences.getInstance();
             setState(() {
               _fid = _readobj ?.getString('fid') ?? "NO IP AVALABLE";
               print("current ip is ${_fid}");
             });
  }

    void _audreq() async{
      print('start');
     var url = AUDITORIUM_BOOKING;
  var data = {
              
              'fid' : _fid ,
              'fname':_firstnamecontroller.text,
              'Lname':_lastnamecontroller.text,
              'address' : _addresscontroller.text,
              'mail':_emailcontroller.text,
              'audiName' : selectedAuditorium,
              'purpose' : _purposecontroller.text,
              'bdate':  selcteddate,
              'btime': selctedtime,


  };

  // {'family_id': widget.id};  	fid, fname, Lname, address, mobile, mail, audiName, purpose, bdate, btime	


  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text('Fetching family data...')),
  // );

  try {
    print('2');
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

      print( "$jsonString is jsonString");
      succesAlert();
     
      if(jsonString == 'sucess'){
        
        succesAlert();
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

void succesAlert() {

                showDialog(
                barrierDismissible: false,
                context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                        child: Icon(CupertinoIcons.check_mark,color: Colors.white,)),

                        Text('Booked', style: TextStyle(fontSize: 20),),
                              Text('You Succesfully Created Your booking', style: TextStyle(fontSize: 16),),

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
                  )
                  );}
                  
                  );
                  
                  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themecolor, title: Text('Auditorium Request')),
      body:Padding(
        padding: const EdgeInsets.all(padding * 0.5),
        child:  _auditoriumListcontroller.auditoriumList.isEmpty
          ? Center(child: constcircularprogrssindicator)
          :SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text("Auditorium Booking Request",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(height: 15),
                Text("Personal Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'enter name';
                          }else{
                            return null ;
                          }
                        },
                        controller: _firstnamecontroller,
                        decoration: _inputDecoration('First Name'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                         validator: (value) {
                          if(value!.isEmpty){
                            return 'enter last name';
                          }else{
                            return null ;
                          }
                        },
                        controller: _lastnamecontroller,
                        decoration: _inputDecoration('Last Name'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                          if(value!.isEmpty){
                            return 'enter address';
                          }else{
                            return null ;
                          }
                        },
                  maxLines: 3,
                  controller: _addresscontroller,
                  decoration: _inputDecoration('Address'),
                ),
              sizedboxten,
                TextFormField(
                  keyboardType: TextInputType.number,
                   validator: (value) {
                          if(value!.isEmpty){
                            return 'enter mobile number';
                          }else{
                            return null ;
                          }
                        },
                  controller: _mobilecontroller,
                  decoration: _inputDecoration('Mobile'),
                ),
                SizedBox(height: 10),
                TextFormField(
                   validator: (value) {
                          if(value!.isEmpty){
                            return 'enter email';
                          }else{
                            return null ;
                          }
                        },
                  controller: _emailcontroller,
                  decoration: _inputDecoration('Email'),
                ),
                SizedBox(height: 20),
                Text("Booking Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                _buildDropdown(),
                SizedBox(height: 15),
                TextFormField(
                   validator: (value) {
                          if(value!.isEmpty){
                            return 'enter purpose';
                          }else{
                            return null ;
                          }
                        },
                  controller: _purposecontroller,
                  decoration: _inputDecoration('Purpose'),
                ),
                SizedBox(height: 10),
                _buildDatePicker(),
                SizedBox(height: 10),
                _buildTimePicker(),
                sizedboxtw,
                _buildbutton(),
              ],
            ),
          ),
        ),
      ),
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

  Container _buildDropdown() {
    return Container(
      alignment: Alignment.centerRight,
      child:  DropdownButtonFormField<String>(
            alignment: Alignment.centerRight,
            decoration: InputDecoration(
                border: outborder,
                errorBorder: outborder,
                enabledBorder: outborder,
                focusedBorder: outborder,
                disabledBorder: outborder,
                focusedErrorBorder: outborder,
                enabled: true),
            // underline: SizedBox.shrink(),
            value: selectedAuditorium,
            items: _auditoriumListcontroller.auditoriumList
                .map((AuditoriumListmodel item) {
              return DropdownMenuItem<String>(
                value: item.name,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedAuditorium = newValue;
              });
            },
          ),
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
            child: Text(selcteddate, style: TextStyle(color: Colors.black)),
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

  Container _buildTimePicker() {
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
            child: Text(selctedtime, style: TextStyle(color: Colors.black)),
          ),
          IconButton(
            onPressed: () {
              showTimePickerDialog(context);
            },
            icon: Icon(CupertinoIcons.clock, color: themecolor),
          ),
        ],
      ),
    );
  }

  Center _buildbutton() {
    return Center(
      child: ElevatedButton(
        
        onPressed: () {
            if(_formkey.currentState!.validate()){
                  
                _audreq();
                  
                  }
                  
        },
        child: Text(
          'REQUEST BOOKING',
          style: boldname,
        ),
        style: ButtonStyle(
         elevation: WidgetStateProperty.all(5),
          shadowColor: WidgetStateProperty.all(Colors.black),
          backgroundColor:
              MaterialStateProperty.all(themecolor), // Set the background color
        ),
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
                    selcteddate = DateFormat('dd-MM-yyyy').format(value);
                  });
                }
                Navigator.pop(context);
              },
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                print("Selection changed: ${args.value}");
              },
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: DateTime.now(),
              headerStyle: DateRangePickerHeaderStyle(
                backgroundColor: themecolor,
                textAlign: TextAlign.center,
                textStyle: TextStyle(color: Colors.white, fontSize: 18),
              ),
              monthViewSettings: DateRangePickerMonthViewSettings(
                  // Additional settings can go here
                  ),
            ),
          ),
        );
      },
    );
  }

  void showTimePickerDialog(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((TimeOfDay? time) {
      if (time != null) {
        setState(() {
          selctedtime = time.format(context);
        });
      }
    });
  }
  
}

