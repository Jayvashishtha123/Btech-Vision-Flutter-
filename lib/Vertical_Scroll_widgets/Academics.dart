import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Academics extends StatelessWidget {
  const Academics({Key? key});

  @override
  Widget build(BuildContext context) {
    Size sc = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 28, 27),
        title: Text("Academics"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          width: sc.width,
          height: sc.height,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bachelor of Technology (B.Tech) degree in India is an undergraduate academic degree conferred after the completion of a four-year full-time engineering program from All India Council for Technical Education recognised institute.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  "The B.Tech degree is generally awarded by Indian Institutes of Technology, National Institutes of Technology (India), Indian Institutes of Information Technology, or other Centrally Funded Technical Institutes and private deemed universities in various engineering disciplines such as Civil Engineering, Chemical Engineering, Mechanical Engineering, Electrical Engineering, Computer Science and Engineering, Electronics and Communication Engineering, and many more. This degree is generally equivalent to a Bachelor of Engineering offered in other Affiliated Engineering colleges of State Collegiate universities or a Bachelor of Science in Engineering or Bachelor of Engineering in the United States and Europe.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Eligibility for a B.Tech program in India typically requires candidates to have completed their higher secondary education (10+2) with mandatory subjects such as mathematics, physics and chemistry or other technical subjects. Institutions often set a minimum aggregate percentage requirement, usually 75% and the Joint Entrance Examination (JEE) Main is a prominent entrance exam for B.Tech admissions, comprising questions in Mathematics, Physics and Chemistry. JEE Advanced is the subsequent exam for those trying to enter the Indian Institutes of Technology (IITs). Admission to National Institutes of Technology (NITs), Indian Institutes of Information Technology (IIITs), other Government Funded Technical Institutes (GFTIs) and deemed universities like Amrita Vishwa Vidyapeetham, International Institute of Information Technology, Hyderabad are based on JEE Main scores.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
