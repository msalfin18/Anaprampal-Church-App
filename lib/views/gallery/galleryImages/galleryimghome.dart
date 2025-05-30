import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/imageviewgrid.dart';
import 'package:flutter/material.dart';

class ImagegalleryHomeScreen extends StatefulWidget {
  const ImagegalleryHomeScreen({super.key});

  @override
  State<ImagegalleryHomeScreen> createState() => _ImagegalleryHomeScreenState();
}

class _ImagegalleryHomeScreenState extends State<ImagegalleryHomeScreen> {
  ImagesCategoryController _imagesCategoryController = ImagesCategoryController();

  
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchImagecategories();
  }

  Future<void> fetchImagecategories() async {
    await _imagesCategoryController.fetchImagecategory();
    setState(() {
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery'),backgroundColor: themecolor,),
      body: ListView.builder(
        itemCount: _imagesCategoryController.imagecategoryList.length ,
        itemBuilder: (context, index) {
          
          ImagecategoryModel imagecategoryModel = _imagesCategoryController.imagecategoryList[index];
        
           return Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding*0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GridImagesScreen(id: imagecategoryModel.id ,category: imagecategoryModel.categoryName,)));
                },
                child: CustomListtile(title: imagecategoryModel.categoryName)),

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