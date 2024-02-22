import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 200, 196),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: List.empty()),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                  Spacer(),
                  Text(
                    "Courses",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Spacer()
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Here, the list of courses in Btech.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: screenSize.width,
            height: screenSize.height * .8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text("CSE"),
                      subtitle: Text("Computer Science and Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("ECE"),
                      subtitle:
                          Text("Electronics and Communication Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("EE"),
                      subtitle: Text("Electrical Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("CE"),
                      subtitle: Text("Civil Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("ME"),
                      subtitle: Text("Mechanical Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("EEE"),
                      subtitle: Text("Electrical and Electronic Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("AE"),
                      subtitle: Text("Aeronautical Engineering"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("AE"),
                      subtitle: Text("Automobile Engineering"),
                    ),
                  ),
                  Text(
                    "Btech Courses with specialization",
                    style: TextStyle(color: Colors.white),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("CSE(+AI,ML)"),
                      subtitle: Text(
                          "CSE with Artificial Intelligence and Machine learning"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("CSE(+CC)"),
                      subtitle: Text("CSE with Cloud Computing"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("ECE(+IOT)"),
                      subtitle: Text("ECE with Internet of Thing"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("ME(+M)"),
                      subtitle: Text("Mechanical Eng. with Mechatronics"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("CSE(+CS)"),
                      subtitle: Text("CSE with Cyber Security"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "There are many other course also available for diploma students.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer()
        ],
      )),
    );
  }
}
