import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:btech_vision/drawer.dart';
import 'package:flutter/services.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => MyDrawer()));
            },
            child: Icon(CupertinoIcons.back)),
        backgroundColor: const Color.fromARGB(31, 0, 0, 0),
        title: Text('Help Page'),
      ),
      backgroundColor: const Color.fromARGB(96, 119, 117, 117),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            FAQItem(
              question: 'What is BTech Vision?',
              answer:
                  'It is a app created by us, to help all the students who want to know about Btech course of Engineering.',
            ),
            FAQItem(
              question: 'why we need this application?',
              answer:
                  'To explore Btech Domain and also we have provided some stuff to help you in ur studies.',
            ),
            FAQItem(
              question: 'Why we us it?',
              answer:
                  'We will make additional features in this app in future that will help you a lot.',
            ),
            FAQItem(
              question: 'Can we chat with you via this App?',
              answer:
                  'Not with this version(1.0.0) this feature will be updated in furthur versions, You can contact us via Social Media Platforms mention in App.',
            ),
            FAQItem(
              question: 'Do we got handwritten note?',
              answer:
                  'Yes, ofcourse there is a option of notes where u got Handwritten notes of Engineers.',
            ),
            // Add more FAQ items as needed
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
