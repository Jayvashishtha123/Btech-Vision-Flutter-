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
              question: 'How do I download and install BTech Vision?',
              answer:
                  'You can download and install BTech Vision from the official app store on your device. Search for "BTech Vision" and follow the installation instructions.',
            ),
            FAQItem(
              question: 'Is BTech Vision available on both Android and iOS?',
              answer:
                  'Yes, BTech Vision is available on both the Android and iOS platforms. You can download it from Google Play Store for Android devices and the App Store for iOS devices.',
            ),
            FAQItem(
              question: 'Can I suggest new features for BTech Vision?',
              answer:
                  'Absolutely! We appreciate user feedback. You can suggest new features or improvements through our contact channels or social media platforms. Your input helps us make the app better.',
            ),
            FAQItem(
              question: 'Are there any in-app purchases?',
              answer:
                  'As of version 1.0.0, BTech Vision does not have any in-app purchases. All features are accessible to users without any additional charges.',
            ),
            FAQItem(
              question: 'How often is the app updated?',
              answer:
                  'We strive to provide regular updates to improve user experience and add new features. Updates are usually scheduled, and announcements will be made on our official channels.',
            ),

            FAQItem(
              question: 'Can we chat with you via this App?',
              answer:
                  'Yes ofcourse & You can contact us via Social Media Platforms mention in App.',
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
