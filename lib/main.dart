import 'package:btech_vision/Auth/Auth_Wrapper.dart';
import 'package:btech_vision/Auth/login_page.dart';
import 'package:btech_vision/Auth/sign_up_page.dart';
import 'package:btech_vision/screens/home_screen.dart';

import 'package:btech_vision/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBmEfw4gbn7W6wSBxMSrK0cqJP-KeMBxeE",
        appId: "1:369235753961:android:7afdc5c3f11a5824af6978",
        messagingSenderId: "369235753961",
        projectId: "btech-vision-8375a",
        // Your web Firebase config options.
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Btech Vision',
      routes: {
        '/': (context) => AuthenticationWrapper(
            // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
            // child: const LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
