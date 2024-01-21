import 'package:audioplayers/audioplayers.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  PdfView({super.key});
  AudioPlayer audioplayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 5, 221, 117)),
      width: screenSize.width,
      height: screenSize.height,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
              //Button for going back............
              leading: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  },
                  child: Icon(CupertinoIcons.back)),
              //FOR title........
              title: Center(
                child: Text(
                  "DBMS NOTES",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.amber),
                ),
              ),
              backgroundColor: Colors.black87,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  //NOT WORKING THIS ONTAP EVENT CHECK LATER
                  onTap: () async {
                    //final player = AudioPlayer();
                    audioplayer
                        .play(AssetSource("assets/Audio_Files/demo.mp3"));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 210, 200, 212),
                    ),
                    width: screenSize.width * .99,
                    height: screenSize.height * .06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Scroll Horizontally",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Image.asset(
                          "assets/images/hand.png",
                          scale: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //THIS CONTAINER IS FOR VIEWING THE PDF.........
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 3, 3),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Color.fromARGB(255, 29, 221, 163)
                        ],
                      ),
                      boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 1),
                          blurRadius: 50.0,
                        ),
                      ]),
                  width: screenSize.width,
                  height: screenSize.height * .7,
                  child: SfPdfViewer.asset(
                    "assets/pdfs/DBMS.pdf",
                    scrollDirection: PdfScrollDirection.horizontal,
                    onTap: (details) {},
                  ),
                )
              ],
            )),
      ),
    );
  }
}
