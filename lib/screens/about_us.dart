import 'package:btech_vision/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
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
                              MaterialPageRoute(builder: (_) => MyDrawer()));
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          color: Color.fromARGB(255, 86, 83, 83),
                        ),
                      ))),
              Positioned(
                top: 60,
                left: 60,
                child: Text(
                  "About us!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 165, 163, 163), fontSize: 30),
                ),
              ),
              Positioned(
                top: 105,
                left: 20,
                child: Text(
                  "I am '𝐉𝐚𝐲 𝐕𝐚𝐫𝐝𝐡𝐚𝐧 𝐕𝐚𝐬𝐡𝐢𝐬𝐡𝐭𝐡𝐚'",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 122,
                left: 35,
                child: Text(
                  "I am a B.Tech student in 𝐍𝐢𝐭 𝐩𝐚𝐭𝐧𝐚, developed this",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 142,
                left: 35,
                child: Text(
                  "application as one of myproject. This app",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 160,
                left: 35,
                child: Text(
                  "focused to help you to know about the course",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 162,
                left: 35,
                child: Text(
                  "",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 177,
                left: 35,
                child: Text(
                  "structure of B.Tech as well as we have provided",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 195,
                left: 35,
                child: Text(
                  "study material, Which will help you in your study.",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Positioned(
                top: 280,
                child: Container(
                  width: screenSize.width,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                      color: Color.fromARGB(255, 84, 85, 82)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: SizedBox(
                            width: 150,
                            child: Image.asset("assets/images/jay.jpeg")),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "𝙅𝙖𝙮 𝙑𝙖𝙧𝙙𝙝𝙖𝙣 𝙑𝙖𝙨𝙝𝙞𝙨𝙝𝙩𝙝𝙖",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              "App Developer(Flutter)",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 114, 112, 108)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, top: 10),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 12),
                                child: Text(
                                  "CSE Department",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Color.fromARGB(255, 141, 134, 112),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, top: 10),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 25),
                                child: Text(
                                  "Second Year",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Color.fromARGB(255, 141, 134, 112),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, top: 10),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, left: 30),
                                child: Text(
                                  "Nit Patna",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Color.fromARGB(255, 141, 134, 112),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          width: 25,
                          child: InkWell(
                              onTap: () {
                                launchURL1();
                              },
                              child: Image.asset(
                                  "assets/images/linkedin (1).png")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   top: 480,
              //   child: Container(
              //     width: screenSize.width,
              //     height: 150,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.black),
              //         borderRadius: BorderRadius.only(
              //             topRight: Radius.circular(100),
              //             bottomRight: Radius.circular(100)),
              //         color: Color.fromARGB(255, 84, 85, 82)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(0.5),
              //           child: Image.asset("assets/images/priyanshu.jpeg"),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Column(
              //           children: [
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 40),
              //               child: Text(
              //                 "𝙋𝙧𝙞𝙮𝙖𝙣𝙨𝙝𝙪 𝙍𝙖𝙟",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 40),
              //               child: Text(
              //                 "Web Developer",
              //                 style: TextStyle(
              //                     fontSize: 10,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(255, 114, 112, 108)),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 20, top: 10),
              //               child: Container(
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.only(top: 4, left: 12),
              //                   child: Text(
              //                     "CSE Department",
              //                     style: TextStyle(
              //                         fontSize: 10,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //                 width: 100,
              //                 height: 20,
              //                 decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.black),
              //                     color: Color.fromARGB(255, 141, 134, 112),
              //                     borderRadius: BorderRadius.circular(20)),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 20, top: 10),
              //               child: Container(
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.only(top: 4, left: 20),
              //                   child: Text(
              //                     "Second Year",
              //                     style: TextStyle(
              //                         fontSize: 10,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //                 width: 100,
              //                 height: 20,
              //                 decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.black),
              //                     color: Color.fromARGB(255, 141, 134, 112),
              //                     borderRadius: BorderRadius.circular(20)),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(right: 20, top: 10),
              //               child: Container(
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.only(top: 4, left: 25),
              //                   child: Text(
              //                     "Nit Patna",
              //                     style: TextStyle(
              //                         fontSize: 10,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //                 width: 100,
              //                 height: 20,
              //                 decoration: BoxDecoration(
              //                     border: Border.all(color: Colors.black),
              //                     color: Color.fromARGB(255, 141, 134, 112),
              //                     borderRadius: BorderRadius.circular(20)),
              //               ),
              //             )
              //           ],
              //         ),
              //         SizedBox(
              //           width: 0,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(top: 20, left: 10),
              //           child: Container(
              //             width: 25,
              //             child: InkWell(
              //                 onTap: () {
              //                   launchURL2();
              //                 },
              //                 child: Image.asset(
              //                     "assets/images/linkedin (1).png")),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void launchURL1() async {
    final Uri _url = Uri.parse(
        'https://www.linkedin.com/in/jay-vardhan-vashishtha-6aa069250/');
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
