import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/Constraints/background.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/views/dues_payesments/dueshome.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/homecontainer/church_gallery.dart';
import 'package:anaprampalmtc/views/homecontainer/events.dart';
import 'package:anaprampalmtc/views/homecontainer/news_and_eventsscreen.dart';
import 'package:anaprampalmtc/views/homecontainer/our_parishscreen.dart';
import 'package:anaprampalmtc/views/homecontainer/parish_vicar.dart';
import 'package:anaprampalmtc/views/homecontainer/parish_ward.dart';
import 'package:anaprampalmtc/views/homecontainer/parish_contact.dart';
import 'package:anaprampalmtc/views/homecontainer/request_booking.dart';
import 'package:anaprampalmtc/views/homecontainer/settings.dart';
import 'package:anaprampalmtc/views/splashhome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final HomeScreenImageController homeScreenImageController = HomeScreenImageController();
  final BottomHomeimgController bottomHomeimgController = BottomHomeimgController();

    bool isLoading = true;
       
    Future<void> fetchData() async {
        print('hoooooiuuui');
    await homeScreenImageController.fetchImages();
     await bottomHomeimgController.fetchBottomImage();
    
    setState(() {
     isLoading = false;
   
    });
  }

 @override
void initState() {
  super.initState();

  fetchData();
   
}


  @override
  Widget build(BuildContext context) {
       final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
  
    
       
              return    Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading : false,

          title: Text("Anaprampal MTC",style: TextStyle(color: Colors.black),),
                    backgroundColor: themecolor,  actions: [
            PopupMenuButton<String>(
              
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
              color: Colors.white,
              onSelected: (value) {
                // Handle selected option
                
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));
                    },
                    // height: 50,
                    value: 'Settings',
                    child: Container(
                      width: 130,
                      child: Text('Settings' , style: normalname,)),
                  ),
                 const PopupMenuDivider(),
                  PopupMenuItem(
                    onTap: () {
                   logout();
                      
                    },
                    value: 'Logout',
                    child: Text('Logout' , style: normalname),
                  ),
                 
                ];
                
  })
  
     ]   ),     
        body: Column(
          // physics: NeverScrollableScrollPhysics(),
          children: [
         isLoading
            ?  Center(child: constcircularprogrssindicator)
            : CarouselSlider.builder(
        itemCount: homeScreenImageController.images.length,
              
        itemBuilder: (context, index, realIndex) {
              HomeScreenImageModel homeScreenImageModel = homeScreenImageController.images[index];
              return Image(
              
        
        image: NetworkImage(IMAGE_SLIDER_URL+homeScreenImageModel.imageName),
        fit: BoxFit.fill,
        width: double.infinity,
              );
              // print(IMAGE_SLIDER_URL+ '/'+homeScreenImageModel.imageName);
        },
        options: CarouselOptions(
               height: screenHeight * 0.25,
         viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2), 
              autoPlayAnimationDuration: Duration(milliseconds: 800), 
              autoPlayCurve: Curves.linearToEaseOut, 
              enlargeCenterPage: false, 
        ),
              ),
          
              Spacer(),
              
             Center(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  ////row 1
                  Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                 
                    },
                    child: Column(
                      children: [
                        GestureDetector(
                           onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>OurParishscreen())); 
                        },
                          child: Container(
                           height: screenHeight * homecontainerheight,width: screenWidth * homecontainerwidth,          
                            child: Image(image: AssetImage('assets/homeimg/ic_comittee.png'))
                              
                            ),
                        ), 
                          Text("our",style: normalname),
                          Text("Parish",style: boldname)
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ParishVicarscreen())); 
                        },
                        child: Container(
                         height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,          
                          child: Image(image: AssetImage('assets/homeimg/ic_message.png'))
                            
                          ),
                      ), 
                        Text("parish",style:normalname,),
                        Text("Vicar",style: boldname)
                    ],
                  ),
                   Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsandEvents()));
                        },
                        child: Container(
                         height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,          
                          child: Image(image: AssetImage('assets/homeimg/ic_news.png'))
                            
                          ),
                      ), 
                        Text("news",style:normalname),
                        Text("Events",style: boldname)
                    ],
                  ),
                  Spacer()
                ],
                           ),
                
                  /////
                   SizedBox(height: screenHeight * 0.04,),
                  ///Row 2
                  
                      Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ParihDirectoryScreen())); 
                        },
                        child: Container(
                         height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,          
                          child: Image(image: AssetImage('assets/homeimg/ic_directory.png'),fit: BoxFit.contain,)
                            
                          ),
                      ), 
                        Text("parish",style: normalname),
                        Text("Directory",style:boldname)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> CalendarScreen()));
                       },
                        child: Container(
                                           height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,         
                          child: Image(image: AssetImage('assets/homeimg/ic_birthday.png'))
                            
                          ),
                      ), 
                        Text("Bday & Any",style: normalname,),
                        Text("Occasion",style:boldname)
                    ],
                  ),
                   Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RequestBooking()));
                        },
                        child: Container(
                        height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,           
                          child: Image(image: AssetImage('assets/homeimg/ic_booking.png'))
                            
                          ),
                      ), 
                        Text("request",style: normalname),
                        Text("Bookings",style: boldname)
                    ],
                  ),
                  Spacer()
                ],
                           ),
                           
                  ///
                   SizedBox(height: screenHeight * 0.04,),
                  
                  ///Row 3
                  
                      Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DownloadGalleryScreen()));
                        },
                        child: Container(
                         height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,          
                          child: Image(image: AssetImage('assets/homeimg/ic_gallery_album.png'))
                            
                          ),
                      ), 
                        Text("Download",style: normalname),
                        Text("Gallery",style:boldname)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DueshomeScreen()));
                        },
                        child: Container(
                                height: screenHeight * homecontainerheight,width:  screenWidth * homecontainerwidth,  
                          child: Image(image: AssetImage('assets/homeimg/ic_lectionary.png'))
                            
                          ),
                      ), 
                        Text("Dues &",style: normalname),
                        Text("Payment List",style: boldname)
                    ],
                  ),
                   Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ParishcontactScreen()));
                        },
                        child: Container(
                         height:screenHeight * homecontainerheight ,width:  screenWidth * homecontainerwidth,          
                          child: Image(image: AssetImage('assets/homeimg/ic_contact.png'))
                            
                          ),
                      ), 
                        Text("Parish",style: normalname),
                        Text("Contact",style: boldname)
                    ],
                  ),
                  Spacer(),
                  
                  
                ],
                           ),
                           
                       
                  ///
                  
                ],
               ),
             ),

              Spacer(),
             
          ],
              
        ),

        bottomNavigationBar:   
         isLoading
        ? Center(
        child: constcircularprogrssindicator,
      )
        : Image(
        height: screenHeight * 0.12,
        width: double.infinity,
        image: NetworkImage(bottomHomeimgController.bottomImage.bottomImageUrl),
        fit: BoxFit.fill 
      ),
      
      
    
    );
  }

  void logout() async {
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

}