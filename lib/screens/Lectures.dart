import 'package:btech_vision/screens/cse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoList extends StatelessWidget {
  final List<String> videoUrls = [
    '_kC8hOVvE5w',
    'h4K12bLxY8g',
    'VshSYqir10A',
  ];

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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => cse()));
                          },
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 40,
                      ),
                      //Spacer(),
                      Text(
                        'Video Lectures',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'pacifico'),
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
                  itemCount: videoUrls.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              //shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 59, 0, 238)
                                      .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 0,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 255, 85, 0)),
                          width: screenSize.width,
                          child: ListTile(
                            title: Text(
                              'Video $index',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 61, 59, 52)),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoScreen1(videoUrl: videoUrls[index]),
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
              Spacer(),
              Text(
                "More Lecture Will be availaible Here!",
                style:
                    TextStyle(color: const Color.fromARGB(255, 211, 211, 208)),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoScreen1 extends StatefulWidget {
  final String videoUrl;

  VideoScreen1({required this.videoUrl});

  @override
  _VideoScreen1State createState() => _VideoScreen1State();
}

class _VideoScreen1State extends State<VideoScreen1> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text('Video Lecture:'),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Color.fromARGB(255, 235, 109, 109),
              )),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: const Color.fromARGB(255, 59, 62, 69),
                progressColors: const ProgressBarColors(
                  playedColor: Color.fromARGB(255, 136, 130, 110),
                  handleColor: Color.fromARGB(255, 207, 23, 23),
                ),
              ),
            ),
            Spacer(),
            Text('For More Videos: Follow our youtube channel')
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
