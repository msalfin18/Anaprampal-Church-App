import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/Constraints/constands.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:anaprampalmtc/controller/controller.dart';
import 'package:anaprampalmtc/models/models.dart';
import 'package:anaprampalmtc/views/gallery/galleryImages/imageviewgrid.dart';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class DownloadfilesScreen extends StatefulWidget {
  const DownloadfilesScreen({super.key});

  @override
  State<DownloadfilesScreen> createState() => _DownloadfilesScreenState();
}

class _DownloadfilesScreenState extends State<DownloadfilesScreen> {
  DownloadFilesController _downloadFilesController = DownloadFilesController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchdwldfilescontroler();
  }

  Future<void> fetchdwldfilescontroler() async {
    await _downloadFilesController.fetchdownloadfiles();
    setState(() {
      isLoading = false;
    });
  }

  // Method to download the file
  // Future<void> downloadFile(String url, String filename) async {
  //   Dio dio = Dio();
  //   try {
      
  //     var dir = await getExternalStorageDirectory();
  //     String savePath = '${dir?.path}/$filename';

  //     // Start downloading the file
  //     await dio.download(url, savePath, onReceiveProgress: (received, total) {
  //       if (total != -1) {
  //         print((received / total! * 100).toStringAsFixed(0) + "%");
  //       }
  //     });

  //     // Show success message when download is complete
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('downloaded')));
  //   } catch (e) {
  //     print("Download error: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to download $filename')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloads'), backgroundColor: themecolor),
      body: isLoading
          ? Center(child: constcircularprogrssindicator)  // Show a loading indicator while fetching data
          : ListView.builder(
              itemCount: _downloadFilesController.downloadFilesList.length,
              itemBuilder: (context, index) {
                DownloadFilesModel downloadFilesModel = _downloadFilesController.downloadFilesList[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding * 0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Call the download method when the download icon is tapped
                          // downloadFile(downloadFilesModel.file, downloadFilesModel.title);
                        },
                        child: CustomListtile(title: downloadFilesModel.title),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class CustomListtile extends StatelessWidget {
  final String title;

  CustomListtile({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListTile(
        leading: Image(image: AssetImage('assets/gallery/file.png') ,height: 35,fit: BoxFit.scaleDown,),
        title: Text(title, style: boldname),
        trailing: Icon(Icons.download, color: themecolor),
      ),
    );
  }
}
