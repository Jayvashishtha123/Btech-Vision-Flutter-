import 'package:btech_vision/Auth/login_page.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:btech_vision/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          // User is signed in
          return HomeScreen();
        } else {
          // User is not signed in
          return SplashScreen(
            child: LoginPage(),
          );
        }
      },
    );
  }
}
