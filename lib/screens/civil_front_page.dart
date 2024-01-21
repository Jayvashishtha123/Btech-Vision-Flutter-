import 'package:btech_vision/screens/cse.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import 'package:url_launcher/url_launcher.dart';

class about_civil extends StatelessWidget {
  about_civil({super.key});

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
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Positioned(
                top: 120,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 35, 36),
                  ),
                ),
              ),
              Container(
                width: screenSize.width,
                height: screenSize.height * .3,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              Positioned(
                  top: 20,
                  left: 25,
                  child: SizedBox(
                      width: 30,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          color: Color.fromARGB(255, 86, 83, 83),
                        ),
                      ))),
              Positioned(
                top: 20,
                left: 150,
                child: Text(
                  "CSE",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 105,
                left: 20,
                child: Text(
                  'I am 𝐉𝐚𝐲 𝐕𝐚𝐫𝐝𝐡𝐚𝐧 𝐕𝐚𝐬𝐡𝐢𝐬𝐡𝐭𝐡𝐚, with my friend 𝐏𝐫𝐢𝐲𝐚𝐧𝐬𝐡𝐮 𝐑𝐚𝐣.\n'
                  'kejdeohjfheihdijhkwndkpowhijkhoujbsw\n'
                  'gvhjkiouygfgvhbjklugyfhjkhgfcgvhbjkhgv',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  maxLines: 1,
                  //overflow: TextOverflow.ellipsis,
                  //softWrap: true,
                ),
              ),
              Positioned(
                top: 260,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenSize.width * .98,
                    child: Text(
                      'Computer science is the study of computation, information, and automation.Computer science spans theoretical disciplines (such as algorithms, theory of computation, and information theory) to applied disciplines (including the design and implementation of hardware and software).Though more often considered an academic discipline, computer science is closely related to computer programming.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 420,
                left: 250,
                child: InkWell(
                  onTap: () {
                    launchURL1();
                  },
                  child: Text(
                    "Read more",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Positioned(
                top: 550,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenSize.width * .9,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                            //topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            //bottomLeft: Radius.circular(30),
                          ),
                          color: Color.fromARGB(255, 187, 185, 185)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => cse()));
                        },
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.threeLine,
                          minLeadingWidth: 60,
                          leading: Icon(
                            CupertinoIcons.arrow_right_to_line_alt,
                            size: 30,
                            shadows: [],
                          ),
                          iconColor: Colors.black,
                          title: Text(
                            "Press Here",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                          trailing: Icon(
                            CupertinoIcons.arrow_left_to_line,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchURL1() async {
    final Uri _url =
        Uri.parse('https://en.wikipedia.org/wiki/Computer_science');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void launchURL2() async {
    final Uri _url = Uri.parse(
        'https://www.linkedin.com/in/priyanshu-raj-nit-patna-49a293257/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
