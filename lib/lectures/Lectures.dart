import 'package:btech_vision/lectures/video_screen.dart';
import 'package:btech_vision/screens/cse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<String> videoPaths = [];

  @override
  void initState() {
    super.initState();
    _fetchVideoPaths();
  }

  Future<void> _fetchVideoPaths() async {
    try {
      // Replace 'your_folder' with the actual folder path in your Firebase Storage
      var listResult = await firebase_storage.FirebaseStorage.instance
          .ref('videos')
          .listAll();

      setState(() {
        videoPaths = listResult.items.map((item) => item.fullPath).toList();
      });
    } catch (error) {
      print('Error fetching video paths: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: screenSize.width,
                color: const Color.fromARGB(255, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/cse');
                        },
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        'Video Lectures',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  itemCount: videoPaths.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 59, 0, 238)
                                    .withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 0,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 255, 85, 0),
                          ),
                          width: screenSize.width,
                          child: ListTile(
                            title: Text(
                              'Video $index',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 61, 59, 52),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoScreen(
                                    videoPath: videoPaths[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
