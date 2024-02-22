import 'package:btech_vision/screens/cse.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class about_cse extends StatelessWidget {
  const about_cse({Key? key}) : super(key: key);

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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
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
                  "CSE",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 30,
                child: Text(
                  '(Computer Science and Engineering)',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  maxLines: 1,
                ),
              ),
              Positioned(
                top: 260,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenSize.width * .98,
                    child: Text(
                      'Computer science is the study of computation, information, and automation. Computer science spans theoretical disciplines such as algorithms, theory of computation, and information theory to applied disciplines including the design and implementation of hardware and software. Though more often considered an academic discipline, computer science is closely related to computer programming.',
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
                  onTap: () => launchURL(
                      'https://en.wikipedia.org/wiki/Computer_science'),
                  child: Text(
                    "Read more",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
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
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: Color.fromARGB(255, 187, 185, 185),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => cse())),
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
