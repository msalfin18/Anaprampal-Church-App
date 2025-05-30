import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/views/settingswebview/feedback.dart';
import 'package:anaprampalmtc/views/settingswebview/privacypolicy.dart';
import 'package:anaprampalmtc/views/settingswebview/termsconditions.dart';
import 'package:anaprampalmtc/views/splashhome.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io'; 


   String? _currentLocation;
   String ? lat;
   String? lon ;
     SharedPreferences ? _readobj ;
  late String _fid ;
  File? _image; // Add this to store the image file



class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadpref();
  }

    Future<void>_loadpref()async{
             _readobj = await SharedPreferences.getInstance();
             setState(() {
               _fid = _readobj ?.getString('fid') ?? "NO IP AVALABLE";
               print("current ip is ${_fid}");
             });
  }




//''''''''''''''''''''''gallery

// File? _image;

  Future<void> fileUpload() async {
    // Request gallery permission
    var status = await Permission.photos.request();

    if (status.isGranted) {
      // Open gallery if permission is granted
      await openGallery();
    } else if (status.isPermanentlyDenied) {
      // Open app settings if permission is permanently denied
      openAppSettings();
    } else {
      print("Gallery permission denied.");
    }
  }

  Future<void> openGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });


      setimage();


      print("Image selected: ${image.path}");
    } else {
      print("No image selected.");
    }
  }


 
  void setimage() async {
    if (_image != null) {
      String base64Image = base64Encode(_image!.readAsBytesSync());

      try {
        var response = await http.post(
          Uri.parse(PHOTO_UPDATE),
          body: { 
            'fid' : _fid,
            'image': base64Image,
          },
        );

        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        var jsonData = jsonDecode(response.body);
      
  

        if ( response.statusCode == 200) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Succesfully image updated !')));

        setState(() {
          
        });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('failed')),
          );
             setState(() {
          
        });
        }
      } 
      catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during submission')),
        );
           setState(() {
          
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image to submit')),
      );
         setState(() {
          
        });
    }
  }
  


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: themecolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding *0.5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10,),
          
              ListTile(title: Text('Settings', style: TextStyle(color: Colors.grey[600] , fontSize: 14),)),
              // SizedBox(height: 5,),
              ListTile(
                title: Text('Set Location' , style: normalname,),
                //  subtitle: _currentLocation != null
                // ? Text(_currentLocation!)
                // : const Text("Tap to get your current location"),
                onTap: () async {
              String location = await getCurrentLocation();
              setState(() {
                _currentLocation = location;
              });
              
              if(location != null){
                _locationfunction(context);
              }

            },),

              // SizedBox(height: 5,),
          
              ListTile(
                onTap: () {
                  _uploadimg(context);
                },
                title: Text('Upload Family Image', style: normalname,)),
          
              Divider(thickness: 1,),
          
              // SizedBox(height: 5,)
          
               ListTile(title: Text('Account', style: TextStyle(color: Colors.grey[600] , fontSize: 14),)),
          
                ListTile(
                  onTap: () {
                    logout(context);
                  },
                  title: Text('Logout' , style: normalname,)),
          
                
              Divider(thickness: 1,),
          
                Text('support', style: TextStyle(color: Colors.grey[600] , fontSize: 14),),
                 
                  ListTile(
                    title: Text('Feedback' , style: normalname,),
                     onTap: () {
                        // Navigator.push(context,MaterialPageRoute(builder: (context)=> FeedbackScreen()));
                     },

                    ),
          
                ListTile(title: Text('Privacy Policy' , style: normalname,),
                  onTap: () {
                      //  Navigator.push(context,MaterialPageRoute(builder: (context)=> PrivacypolicyScreen()));
                     },

                ),
          
                ListTile(title: Text('Terms & Conditions' , style: normalname,),
                
                  onTap: () {
                      //  Navigator.push(context,MaterialPageRoute(builder: (context)=> TermsconditionsScreen()));
                     },
),
          
              Divider(thickness: 1,),
          
              ListTile(title: Text('About', style: TextStyle(color: Colors.grey[600] , fontSize: 14),)),
          
                ListTile(
                 title: Text('Version', style:  normalname),
                 subtitle: Text('1.0' , style: TextStyle(color: Colors.grey[600] , fontSize: 14), ),
                 ),
          
              
            ],
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context)async {
  // Show confirmation dialog
  bool? confirmLogout = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(side: BorderSide.none , borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
              style: ButtonStyle(
              shadowColor: WidgetStateProperty.all(Colors.black),
                elevation: WidgetStateProperty.all(2),
                backgroundColor: WidgetStateProperty.all(themecolor)),
            child: Text('No',style: normalname,),
            onPressed: () {
              Navigator.of(context).pop(false); // User pressed No
            },
          ),
          TextButton(
            child: Text('Yes' , style: normalname,),
            onPressed: () {
              Navigator.of(context).pop(true); // User pressed Yes
            },
          ),
        ],
      );
    },
  );

  // If user confirmed logout
  if (confirmLogout == true) {
    SharedPreferences logpref = await SharedPreferences.getInstance();
    await logpref.clear(); // Clear all data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Splashhome()), // Pass your onLogin function
    );
  }
}




// location.....................................................

Future<String> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return "Location services are disabled.";
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "Location permissions are denied.";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return "Location permissions are permanently denied.";
    }

    // Get the current position
    final position = await Geolocator.getCurrentPosition();
       lat = position.latitude.toString();
       lon = position.longitude.toString();
    return "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
  }


void _uploadimg(BuildContext context) {

   showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(side: BorderSide.none , borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        title: Text('Upload image'),
        content: Text('Do you want to upoad your family image'),
        actions: [
          TextButton(
            child: Text('No',style: normalname,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            
            style: ButtonStyle(
               shadowColor: WidgetStateProperty.all(Colors.black),
                elevation: WidgetStateProperty.all(2),
              backgroundColor: WidgetStateProperty.all(themecolor)),
            child: Text('Yes' , style: normalname,),
            onPressed: () {
              Navigator.pop(context);
             fileUpload();
             
            },
          ),
        ],
      );
    },
  );


}



}



/////////////////////////


 void _locationfunction(BuildContext context) {

 showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(side: BorderSide.none , borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        title: Text('Update Location'),
        content: Text('Do you want to update your location to current location'),
        actions: [
          TextButton(
            child: Text('No',style: normalname,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            
            style: ButtonStyle(
               shadowColor: WidgetStateProperty.all(Colors.black),
                elevation: WidgetStateProperty.all(2),
              backgroundColor: WidgetStateProperty.all(themecolor)),
            child: Text('Yes' , style: normalname,),
            onPressed: () {
              setLocation();
            },
          ),
        ],
      );
    },
  );

}

void setLocation()async {


     var url = LOCATION_SET ;
  var data = {
              
              'fid' : _fid ,
              'lat' : lat,
              'lon': lon
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
      // succesAlert();
     
      if(jsonString == 'sucess'){
        
        // succesAlert();
      }
    
      // setState(() {});
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Error: ${response.statusCode}')),
      // );
    }
  } catch (error) {

    print(error);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Network error: $error')),
    // );
  }
}



