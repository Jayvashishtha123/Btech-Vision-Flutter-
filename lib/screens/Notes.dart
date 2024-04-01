import 'package:btech_vision/screens/cse.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/material.dart';

class notes extends StatelessWidget {
  const notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => cse()));
              print("jay");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Notes"),
      ),
      body: SafeArea(
          child: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Text(
            "...Will be available soon...",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      )),
    );
  }
}
