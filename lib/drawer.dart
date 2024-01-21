import 'package:btech_vision/Auth/login_page.dart';
import 'package:btech_vision/chat_page.dart';
import 'package:btech_vision/screens/about_us.dart';
import 'package:btech_vision/screens/help.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
            decoration: BoxDecoration(color: Color.fromARGB(255, 84, 85, 82)),
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/welcome.gif',
                        color: Color.fromARGB(255, 198, 200, 199),
                      ),
                      // Text(
                      //   // myController.text,
                      //   "Hi! jay Vashishtha",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      SizedBox(
                        height: 40,
                        child: Image.asset(
                          "assets/images/hello.gif",

                          //color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                ),
                // TextField(
                //   controller: myController,
                // ),
                //To Get value from textfiled using controller...........
                // InkWell(
                //   onTap: () {
                //     showDialog(
                //       context: context,
                //       builder: (context) {
                //         return AlertDialog(
                //           // Retrieve the text the that user has entered by using the
                //           // TextEditingController.
                //           content: Text(myController.text),
                //         );
                //       },
                //     );
                //   },
                //   child: Text("jay"),
                // ),

                Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * .8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()));
                        },
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: Icon(
                            Icons.home,
                            size: 30,
                            shadows: [],
                          ),
                          iconColor: Colors.black,
                          title: Text(
                            "Home",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * .8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => ChatPage()));
                        },
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: Icon(
                            Icons.chat,
                            size: 30,
                            shadows: [],
                          ),
                          iconColor: Colors.black,
                          title: Text(
                            "Chat with us!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * .8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => FAQPage()));
                        },
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: Icon(
                            Icons.help,
                            size: 30,
                            shadows: [],
                          ),
                          iconColor: Colors.black,
                          title: Text(
                            "Help",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * .8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const about_us()));
                        },
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: SizedBox(
                              height: 30,
                              child: Image.asset("assets/images/aboutus.png")),
                          iconColor: Colors.black,
                          title: Text(
                            "About us!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * .8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: InkWell(
                        onTap: () {
                          launchURL4();
                        },
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: SizedBox(
                              height: 30,
                              child: Icon(Icons.web_asset_outlined)),
                          // child: Image.asset("assets/images/aboutus.png")),
                          iconColor: Colors.black,
                          title: Text(
                            "Our Website!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * .8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: InkWell(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.signOut();
                            print('User signed out');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginPage()));
                          } catch (e) {
                            print('Error signing out: $e');
                            Dialog(
                              child: Text("error"),
                            );
                          }
                        },
                        child: ListTile(
                          minLeadingWidth: 20,
                          leading: SizedBox(
                              height: 30,
                              child: Image.asset("assets/images/logout.png")),
                          iconColor: Colors.black,
                          title: Text(
                            "LogOut",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(),

                Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              launchURL1();
                            },
                            child: Image.asset("assets/images/instagram.png")),
                        InkWell(
                            onTap: () {
                              launchURL2();
                            },
                            child: Image.asset("assets/images/youtube.png")),
                        InkWell(
                            onTap: () {
                              launchURL3();
                            },
                            child: Image.asset("assets/images/linkedin.png")),
                      ],
                    )),
                Spacer(),

                Text("Version 1.0.0"),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launchURL1() async {
    final Uri _url = Uri.parse('https://www.instagram.com/74.97.121.v.v/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void launchURL2() async {
    final Uri _url =
        Uri.parse('https://www.youtube.com/channel/UCDqtgISIh4pWSv2wFWk9ZKw');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void launchURL3() async {
    final Uri _url =
        Uri.parse('https://www.linkedin.com/in/jay-vashishtha-6aa069250/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void launchURL4() async {
    final Uri _url =
        Uri.parse('https://www.linkedin.com/in/jay-vashishtha-6aa069250/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
