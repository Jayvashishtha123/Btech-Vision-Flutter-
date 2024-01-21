import 'package:btech_vision/Auth/login_page.dart';

import 'package:btech_vision/screens/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required LoginPage child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const StartingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backgnd.jpg"),
                  fit: BoxFit.cover)),
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(children: [
            Center(
              child: SizedBox(
                width: 150,
                // height: 250,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              width: screenSize.width,
              child: Text(
                '𝕎𝕖𝕝𝕔𝕠𝕞𝕖 𝕘𝕦𝕪𝕤',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
