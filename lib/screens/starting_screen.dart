import 'package:btech_vision/Auth/login_page.dart';
import 'package:btech_vision/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgnd1.jpg"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          AnimatedPositioned(
              top: 150,
              right: _isAnimate ? 115 : 50,
              width: 150,
              duration: Duration(seconds: 4),
              child: SizedBox(
                  width: 60, child: Image.asset('assets/images/logo.png'))),
          Positioned(
            bottom: screenSize.height * .00001,
            child: Container(
              width: screenSize.width,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(500)),
                color: Color.fromARGB(255, 192, 169, 243),
              ),
            ),
          ),
          AnimatedPositioned(
              top: 600,
              left: _isAnimate ? 120 : 30,
              width: 209,
              height: 52,
              duration: Duration(seconds: 4),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shadowColor: Color(500),
                    backgroundColor: Color.fromARGB(255, 181, 171, 186),
                    shape: StadiumBorder()),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                },
                icon: Icon(
                  Icons.touch_app_sharp,
                ),
                label: RichText(
                  text: const TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(text: 'Lets!  '),
                      TextSpan(
                          text: 'Enter',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
