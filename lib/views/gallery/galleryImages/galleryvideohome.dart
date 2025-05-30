import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/videoview.dart';
import 'package:flutter/material.dart';

class GalleryVideoHomescreen extends StatefulWidget {
  const GalleryVideoHomescreen({super.key});

  @override
  State<GalleryVideoHomescreen> createState() => _GalleryVideoHomescreenState();
}

class _GalleryVideoHomescreenState extends State<GalleryVideoHomescreen> {
  videoCategoryController _videocategorycontroler = videoCategoryController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchImagecategories();
  }

  Future<void> fetchImagecategories() async {
    await _videocategorycontroler.fetchVideocategory();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Gallery'),backgroundColor: themecolor,),
      body: ListView.builder(
        itemCount: _videocategorycontroler.videocategoryList.length ,
        itemBuilder: (context, index) {
          
          VideoCategoryModel videoCategoryModel = _videocategorycontroler.videocategoryList[index];
        
           return Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding * 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Videoviewscreen(id: videoCategoryModel.id ,category: videoCategoryModel.categoryName,)));
                },
                child: CustomListtile(title: videoCategoryModel.categoryName)),

            ],
          ),
        );

        },
      ),
    );
  }
}


class CustomListtile extends StatelessWidget {
  final String title ;
 

   CustomListtile({required this.title ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.zero, 
                    ),
                   child: ListTile(
                    leading: Image(image: AssetImage('assets/gallery/folder.png')),
                    title: Text(title , style: boldname,),
                   ),
                  );
  }
}