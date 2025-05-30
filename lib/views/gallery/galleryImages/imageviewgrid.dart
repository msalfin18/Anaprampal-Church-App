import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/fullscreenimg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridImagesScreen extends StatefulWidget {
  GridImagesScreen({Key? key, required this.id, required this.category}) : super(key: key);

  final String id;
  final String category;

  @override
  State<GridImagesScreen> createState() => _GridImagesScreenState();
}

class _GridImagesScreenState extends State<GridImagesScreen> {
  bool isLoading = true;
  List<dynamic> jsonUserData = []; // Store image data
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchGeneralImages();
  }

  Future<void> _fetchGeneralImages() async {
    setState(() => isLoading = true); // Start loading

    try {
      final url = Uri.parse("$GALLERY_IMAGES${widget.id}");
    
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // print(response.body);

        if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
          
          setState(() {
            jsonUserData = jsonData['data'];
            
            errorMessage = null;
             isLoading = false;
          });
        } else {
          setState(() {
            jsonUserData = [];
            errorMessage = "No images found for this category.";
          
          });
        }
      } 
    } catch (error) {
      setState(() => errorMessage = "Network error: $error");
    } 
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: themecolor,
      ),
      body: isLoading
          ? Center(child:constcircularprogrssindicator)
          : errorMessage != null
              ? Center(
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Display two images per row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: jsonUserData.length,
                  itemBuilder: (context, index) {
                    
                    var image = jsonUserData[index];
                    print(image[0]['image_path']);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Fullscreenimg(image: IMAGE_GALLERY_URL+image[0]['image_path'])));
                      },
                      child: Container(
                        
                        child: Image.network(
                          IMAGE_GALLERY_URL+image[0]['image_path'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
