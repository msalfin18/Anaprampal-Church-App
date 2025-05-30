import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/Constraints/imag.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/downloadfiles.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/galleryimghome.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/galleryvideohome.dart';
import 'package:flutter/material.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';

class DownloadGalleryScreen extends StatelessWidget {
  const DownloadGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: themecolor,title: Text('Church Gallery'),),

      body: Padding(
        padding: const EdgeInsets.all(padding *0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical : padding *0.5)     ,
                 child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ImagegalleryHomeScreen()));
                  },
                   child: Container(
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                        borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                        child: Padding(
                          padding:  outlinedcontainerlargepadding,
                          child: ListTile(
                           
                            leading: Image(image: AssetImage('assets/gallery/ic_gallery.png'),height: containerimageheight,),
                            title: Padding(
                              padding:  EdgeInsets.only(left: tilegap),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text('Gallery',style:normalname,),
                                  Text('Image',style: boldname,),
                                ],
                              ),
                            ),
                          ),
                        ),
                                 ),
                 ),
               ),

                Padding(
                 padding: const EdgeInsets.symmetric(vertical : padding *0.5),
                 child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryVideoHomescreen()));
                  },
                   child: Container(
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                        borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                        child: Padding(
                          padding:  outlinedcontainerlargepadding,
                          child: ListTile(
                           
                            leading: Image(image: AssetImage('assets/gallery/ic_video.png'),height: containerimageheight),
                            title: Padding(
                              padding:  EdgeInsets.only(left: tilegap ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text('Gallery',style: normalname),
                                  Text('Video',style: boldname),
                                ],
                              ),
                            ),
                          ),
                        ),
                                 ),
                 ),
               ),

                Padding(
                 padding:  EdgeInsets.symmetric(vertical: padding * 0.5),
                 child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DownloadfilesScreen()));
                  },
                   child: Container(
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: themecolor,width: outlinedcontainerwidth),
                        borderRadius: BorderRadius.circular(outlinedcontainerradius)),
                        child: Padding(
                          padding:  outlinedcontainerlargepadding,
                          child: ListTile(
                           
                            leading: Image(image: AssetImage('assets/gallery/download.png'),height: containerimageheight,),
                            title: Padding(
                              padding:  EdgeInsets.only(left: tilegap),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text('Files',style: normalname),
                                  Text('Download',style: boldname),
                                ],
                              ),
                            ),
                          ),
                        ),
                                 ),
                 ),
               ),
          ],
        ),
      ),
    );
  }
}