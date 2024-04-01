import 'package:btech_vision/screens/cse.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class about_mechanical extends StatelessWidget {
  const about_mechanical({Key? key}) : super(key: key);

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
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: screenSize.width * .05,
                child: SizedBox(
                  width: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, '/home');
                    },
                    child: Image.asset(
                      "assets/images/back.png",
                      color: Color.fromARGB(255, 86, 83, 83),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: screenSize.width * .4,
                child: Text(
                  "ME",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 90,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    '(Mechanical Engineering)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    maxLines: 1,
                  ),
                ),
              ),
              Positioned(
                top: 260,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: screenSize.width * .98,
                      child: Text(
                        'Mechanical Engineering is a diverse discipline that encompasses the design, analysis, and manufacturing of mechanical systems. Engineers in this field deal with the principles of mechanics, thermodynamics, and materials to develop solutions for a wide range of industries. Mechanical engineers design and optimize machinery, tools, and systems, ensuring they meet efficiency, safety, and environmental standards.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 420,
                left: 250,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: InkWell(
                        onTap: () => launchURL(
                            'https://en.wikipedia.org/wiki/Mechanical_engineering'),
                        child: Text(
                          "Learn More",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "(Wikipedia link)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
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
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: Color.fromARGB(255, 187, 185, 185),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, '/cse'),
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.threeLine,
                          minLeadingWidth: 60,
                          leading: Icon(
                            CupertinoIcons.arrow_right_to_line_alt,
                            size: 25,
                            shadows: [],
                          ),
                          iconColor: Colors.black,
                          title: Center(
                            child: Text(
                              "Press Here      ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 243, 241, 241),
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          trailing: Icon(
                            CupertinoIcons.arrow_left_to_line,
                            size: 25,
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

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
