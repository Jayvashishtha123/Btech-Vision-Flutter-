import 'package:btech_vision/Vertical_Scroll_widgets/Academics.dart';
import 'package:btech_vision/drawer.dart';
import 'package:btech_vision/game/game.dart';
import 'package:btech_vision/profile/profile_page.dart';
import 'package:btech_vision/screens/Courses_page.dart';
import 'package:btech_vision/screens/Home_screen_quiz.dart';
import 'package:btech_vision/screens/Rate_us.dart';
import 'package:btech_vision/screens/about_us.dart';
import 'package:btech_vision/front_pages/civil_front_page.dart';
import 'package:btech_vision/front_pages/cse_front_page.dart';
import 'package:btech_vision/front_pages/ece_front_page.dart';
import 'package:btech_vision/front_pages/ee_front_page.dart';
import 'package:btech_vision/front_pages/mechanical_front_page.dart';
import 'package:btech_vision/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatefulWidget {
  //final User user;

  @override
  _HomeScreenState createState() => _HomeScreenState();

  const HomeScreen({super.key});
}

class _HomeScreenState extends State<HomeScreen> {
  // final TextEditingController _usernameController;
  ScrollController _scrollController = ScrollController();

  void _vibrate() async {
    // Check if the device supports vibration

    // Vibrate for 500 milliseconds
    Vibration.vibrate(duration: 500);
  }

  @override
  Widget build(BuildContext context) {
    // String username = _usernameController.text;

    Size screenSize = MediaQuery.of(context).size;
    // To restrict app work only in portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("For Engineers"),
      //color: const Color.fromARGB(255, 216, 179, 69),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
                left: 155,
                top: 55,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Debrosee',
                      color: Colors.white),
                )),

            // Positioned(top: 40, child: Text('jay')),
            Positioned(
                top: 40,
                left: 15,
                child: IconButton(
                  onPressed: () {
                    _vibrate();

                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => MyDrawer()));
                  },
                  icon: Icon(Icons.waves),
                  color: Colors.white,
                )),
            Positioned(
              top: 50,
              left: screenSize.width * .85,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => ProfilePage()));
                },
                child: SizedBox(
                  width: 40,
                  child: Image.asset(
                    "assets/images/logo.png",
                    scale: 1,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 80,
                left: 100,
                width: 190,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 237, 190, 190),
                      shape: StadiumBorder(),
                      shadowColor: const Color.fromARGB(255, 240, 210, 210),
                      elevation: 5),
                  onPressed: () {},
                  child: Text(
                    'Btech Vision',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),

            Positioned(
                width: 250,
                top: 160,
                left: 20,
                child: Text(
                  'Available Content:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),

            Positioned(
              top: 200,
              left: 2,
              child: Container(
                width: screenSize.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => QuizApp2()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: 20,
                              child: Image.asset('assets/images/quiz (1).png')),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Quiz')
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), backgroundColor: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Courses()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: 17,
                              child: Image.asset(
                                  'assets/images/online-course.png')),
                          SizedBox(
                            width: 9,
                          ),
                          Text('Courses')
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), backgroundColor: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => AboutUs()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: 17,
                              child: Image.asset('assets/images/aboutus.png')),
                          SizedBox(
                            width: 9,
                          ),
                          Text('About us')
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), backgroundColor: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const Rate_us()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: 17,
                              child: Image.asset('assets/images/star.png')),
                          SizedBox(
                            width: 9,
                          ),
                          Text('rate us!')
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), backgroundColor: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ]),
                ),
              ),
            ),
            Positioned(
              top: 255,
              left: 5,
              child: Container(
                width: screenSize.width,
                height: 180,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 156, 156, 228),
                          blurRadius: 15.0,
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => about_cse()));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1,
                              left: 0,
                              right: 5,
                              bottom: 20,
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset('assets/images/CSE.png')),
                            ),
                            Positioned(
                              top: 125,
                              left: 40,
                              child: Text(
                                'CSE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: ContinuousRectangleBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 156, 156, 228),
                          blurRadius: 15.0,
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => about_ece()));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1,
                              left: 0,
                              right: 5,
                              bottom: 20,
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset('assets/images/chip.png')),
                            ),
                            Positioned(
                              top: 125,
                              left: 40,
                              child: Text(
                                'ECE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: ContinuousRectangleBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 156, 156, 228),
                          blurRadius: 15.0,
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => about_ee()));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1,
                              left: 0,
                              right: 5,
                              bottom: 20,
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(
                                      'assets/images/generator.png')),
                            ),
                            Positioned(
                              top: 125,
                              left: 40,
                              child: Text(
                                'EE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: ContinuousRectangleBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 156, 156, 228),
                          blurRadius: 15.0,
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => about_civil()));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1,
                              left: 0,
                              right: 5,
                              bottom: 20,
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(
                                      'assets/images/contractor.png')),
                            ),
                            Positioned(
                              top: 130,
                              left: 30,
                              child: Text(
                                'CIVIL',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: ContinuousRectangleBorder()),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Color.fromARGB(255, 156, 156, 228),
                          blurRadius: 15.0,
                        ),
                      ]),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => about_mechanical()));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 1,
                              left: 0,
                              right: 2,
                              bottom: 20,
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset('assets/images/chip.png')),
                            ),
                            Positioned(
                              top: 125,
                              left: 25,
                              child: Text(
                                'Mechanical',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: ContinuousRectangleBorder()),
                      ),
                    ),
                  ]),
                ),
              ),
            ),

            Positioned(
                width: screenSize.width * .9,
                left: 15,
                top: 440,
                child: Container(
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Features',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 30,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        SizedBox(
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                _scrollToTop();
                              },
                              child: Image.asset(
                                'assets/images/uparrow .png',
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            )),
                        SizedBox(
                          width: 55,
                        ),
                        SizedBox(
                            height: 25,
                            child: InkWell(
                              onTap: () {
                                _scrollToButtom();
                              },
                              child: Image.asset(
                                'assets/images/downarrow.png',
                                color: Color.fromARGB(255, 254, 250, 250),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                          //height: 5,
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
              top: 500,
              right: 1,
              left: 1,
              bottom: 5,
              child: Container(
                decoration:
                    BoxDecoration(color: const Color.fromARGB(255, 0, 0, 0)),
                width: screenSize.width * .1,
                height: screenSize.height * .4,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    // SizedBox(
                    //   height: 1,
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 12, right: 12),
                      child: SizedBox(
                        width: screenSize.width,
                        height: screenSize.height * .1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => Academics()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                //color: const Color.fromARGB(255, 143, 141, 133),
                                border: Border.all(
                                  color: Color.fromARGB(255, 67, 9, 193),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Stack(children: [
                              // Positioned.fill(
                              //   child: Image.asset(
                              //     'assets/images/CSE.png',
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),

                              Positioned(
                                top: 10,
                                left: 15,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Image.asset(
                                          'assets/images/education.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Academics',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        width: screenSize.width * .1,
                        height: screenSize.height * .1,
                        child: Container(
                          decoration: BoxDecoration(
                              // color: const Color.fromARGB(255, 143, 141, 133),
                              border: Border.all(
                                color: Color.fromARGB(255, 67, 9, 193),
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Stack(children: [
                            // Positioned.fill(
                            //   child: Image.asset(
                            //     'assets/images/CSE.png',
                            //     //fit: BoxFit.cover,
                            //   ),
                            // ),
                            Positioned(
                              top: 10,
                              left: 15,
                              child: Row(
                                children: [
                                  Container(
                                      width: 50,
                                      child: Image.asset(
                                          'assets/images/education.png')),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Syllabus',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        width: screenSize.width * .1,
                        height: screenSize.height * .1,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => Task()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 67, 9, 193),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Stack(children: [
                              // Positioned.fill(
                              //   child: Image.asset(
                              //     'assets/images/CSE.png',
                              //     //fit: BoxFit.cover,
                              //   ),
                              // ),
                              Positioned(
                                top: 10,
                                left: 15,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 50,
                                        child: Icon(
                                          Icons.task,
                                          color: Colors.white,
                                          size: 55,
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Task',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        width: screenSize.width * .1,
                        height: screenSize.height * .1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => GuessGame()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 67, 9, 193),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Stack(children: [
                              // Positioned.fill(
                              //   child: Image.asset(
                              //     'assets/images/CSE.png',
                              //     //fit: BoxFit.cover,
                              //   ),
                              // ),
                              Positioned(
                                top: 10,
                                left: 15,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        child: Image.asset(
                                            'assets/images/game.png')),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Guess the Number',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _scrollToButtom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 5),
      curve: Curves.ease,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(seconds: 5),
      curve: Curves.easeInOut,
    );
  }
}
