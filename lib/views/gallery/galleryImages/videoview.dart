import 'dart:convert';
import 'package:anaprampalmtc/Constraints/APIs.dart';
import 'package:anaprampalmtc/Constraints/appbar.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';
import 'package:anaprampalmtc/components/homescreencomponents.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoviewscreen extends StatefulWidget {
  final String id;
  final String category;

  Videoviewscreen({Key? key, required this.id, required this.category}) : super(key: key);

  @override
  State<Videoviewscreen> createState() => _VideoviewscreenState();
}

class _VideoviewscreenState extends State<Videoviewscreen> {
  bool isLoading = true;
  List<dynamic> jsonUserData = []; // Store video data
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchGeneralVideos();
  }

  Future<void> _fetchGeneralVideos() async {
    setState(() => isLoading = true); // Start loading

    try {
      final url = Uri.parse("$GALLERY_VIDEOS${widget.id}");
      print(url);

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
          setState(() {
            jsonUserData = jsonData['data'];
            errorMessage = null;
            isLoading = false;
          });
        } else {
          setState(() {
            jsonUserData = [];
            errorMessage = "No videos found for this category.";
          });
        }
      } else {
        setState(() {
          errorMessage = "Failed to load videos: ${response.statusCode}";
        });
      }
    } catch (error) {
      setState(() => errorMessage = "Network error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Church Videos'),
        backgroundColor: themecolor,
      ),
      body: isLoading
          ? Center(child: constcircularprogrssindicator)
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : ListView.builder(
                  itemCount: jsonUserData.length,
                  itemBuilder: (context, index) {
                    var videoData = jsonUserData[index];
                    String videoUrl = videoData[0]['video_link']; 
                    print(videoUrl);
                    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

                    if (videoId == null) {
                      return Center(child: Text("Invalid YouTube URL."));
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            YoutubePlayer(
                              
                              progressColors: ProgressBarColors(
                                bufferedColor: Colors.white,
                                playedColor: Colors.red),
                              controller: YoutubePlayerController(
                                initialVideoId: videoId,
                                
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                  hideControls: false
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: themecolor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    videoData[0]['title'] ?? "Video Title",
                                    style: boldname
                                  ),
                                  Text(videoData[0]['posted_date'])
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
