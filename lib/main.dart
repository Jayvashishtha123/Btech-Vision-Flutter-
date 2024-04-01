import 'package:btech_vision/Auth/Auth_Wrapper.dart';
import 'package:btech_vision/Auth/login_page.dart';
import 'package:btech_vision/Auth/sign_up_page.dart';
import 'package:btech_vision/Notes_page/Cse_Notes.dart';
import 'package:btech_vision/Vertical_Scroll_widgets/Academics.dart';
import 'package:btech_vision/drawer.dart';
import 'package:btech_vision/front_pages/civil_front_page.dart';
import 'package:btech_vision/front_pages/cse_front_page.dart';
import 'package:btech_vision/front_pages/ece_front_page.dart';
import 'package:btech_vision/front_pages/ee_front_page.dart';
import 'package:btech_vision/front_pages/mechanical_front_page.dart';
import 'package:btech_vision/game/game.dart';
import 'package:btech_vision/react_app/react_site.dart';
import 'package:btech_vision/screens/Courses_page.dart';
import 'package:btech_vision/screens/Home_screen_quiz.dart';
import 'package:btech_vision/screens/Rate_us.dart';
import 'package:btech_vision/screens/Syllabus.dart';
import 'package:btech_vision/screens/about_us.dart';
import 'package:btech_vision/screens/cse.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:btech_vision/task/task_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBmEfw4gbn7W6wSBxMSrK0cqJP-KeMBxeE",
        appId: "1:369235753961:android:7afdc5c3f11a5824af6978",
        messagingSenderId: "369235753961",
        projectId: "btech-vision-8375a",
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
          '/': (context) => AuthenticationWrapper(),
          '/login': (context) => LoginPage(),
          '/signUp': (context) => SignUpPage(),
          '/home': (context) => HomeScreen(),
          '/drawer': (context) => MyDrawer(),
          '/quizApp2': (context) => QuizApp2(),
          '/courses': (context) => Courses(),
          '/AboutUs': (context) => AboutUs(),
          '/Rate_us': (context) => Rate_us(),
          '/about_cse': (context) => about_cse(),
          '/about_ece': (context) => about_ece(),
          '/about_ee': (context) => about_ee(),
          '/about_civil': (context) => about_civil(),
          '/about_mechanical': (context) => about_mechanical(),
          '/Academics': (context) => Academics(),
          '/syllabus': (context) => syllabus(),
          '/BTechTaskPage': (context) => BTechTaskPage(),
          '/GuessGame': (context) => GuessGame(),
          '/cse': (context) => cse(),
          '/WebViewExample': (context) => WebViewExample(),
          '/PdfViewerPage': (context) => PdfViewerPage(),
        });
  }
}
