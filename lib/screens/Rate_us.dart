import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Rate_us extends StatelessWidget {
  const Rate_us({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                  color: Color.fromARGB(96, 44, 203, 9),
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenSize.width,
                      child: Center(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()));
                              },
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,
                            ),
                            Spacer(),
                            Text(
                              "Rate Us!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Spacer()
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //     color: Color.fromARGB(255, 234, 236, 232)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '................Rate Us! on store.................',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ));
  }
}
