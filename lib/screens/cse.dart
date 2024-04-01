import 'package:btech_vision/main.dart';
import 'package:btech_vision/quiz.dart';
import 'package:btech_vision/screens/Books.dart';
import 'package:btech_vision/lectures/Lectures.dart';
import 'package:btech_vision/screens/Notes.dart';
import 'package:btech_vision/screens/Syllabus.dart';
import 'package:btech_vision/screens/assignment_page.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cse extends StatelessWidget {
  const cse({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        //DeviceOrientation.landscapeRight,
      ]);
      Size screenSize = MediaQuery.of(context).size;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 49, 45, 45),
          body: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(color: Colors.black12),
            child: Scaffold(
              backgroundColor: Color.fromARGB(31, 0, 0, 0),
              appBar: AppBar(
                backgroundColor: Color.fromARGB(95, 0, 0, 2),
                leading: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                      // Navigator.pop(context);
                    },
                    child: Icon(CupertinoIcons.back)),
                title: Text("Docs Category"),
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => syllabus()));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(221, 65, 64, 64),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 5)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 85,
                                child: Image.asset("assets/images/open.png",
                                    color: Color.fromARGB(255, 166, 11, 11)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Syllabus",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => QuizApp()));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(221, 65, 64, 64),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 5)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 85,
                                child: Image.asset(
                                  "assets/images/quiz.png",
                                  // color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Quizes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => book()));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(221, 65, 64, 64),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 5)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 85,
                                child: Image.asset(
                                  "assets/images/book.png",
                                  //color: Color.fromARGB(255, 10, 233, 184)
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Books",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => notes()));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(221, 65, 64, 64),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 5)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 80,
                                child: Image.asset(
                                  "assets/images/notepad.png",
                                  //color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Notes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => VideoList()));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(221, 65, 64, 64),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 99, 167, 223),
                                  width: 5)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 85,
                                child: Image.asset(
                                  "assets/images/video-lecture.png",
                                  //color: const Color.fromARGB(255, 243, 51, 33),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Lectures",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const assignment()));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(221, 65, 64, 64),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue, width: 5)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 85,
                                child: Image.asset(
                                  "assets/images/assignment.png",
                                  //color: const Color.fromARGB(255, 243, 51, 33),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Assignments",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
