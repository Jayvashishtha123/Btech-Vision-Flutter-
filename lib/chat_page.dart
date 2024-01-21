import 'package:btech_vision/drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('message').child('messages');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 173, 166, 166),
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => MyDrawer()));
              },
              icon: Icon(CupertinoIcons.back)),
          title: Text('Chat With Us!'),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _databaseReference.onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 350, bottom: 350),
                      child: CircularProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 229, 201, 118),
                        color: const Color.fromARGB(255, 253, 0, 0),
                      ),
                    );
                  }

                  var messages = <String>[];
                  var data = snapshot.data!.snapshot.value;

                  if (data != null) {
                    data.forEach((key, value) {
                      messages.add('$value');
                    });
                  }

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 5, right: 5, top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              //shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 59, 0, 238)
                                      .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 0,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 255, 85, 0)),
                          child: ListTile(
                            // contentPadding: EdgeInsets.only(bottom: 5),
                            leading: Image.asset(
                              "assets/images/gif.gif",
                              width: 30,
                              height: 30,
                            ),
                            title: Text(
                              messages[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 20,
                                  foreground: Paint()),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                              hintText: 'Enter your message...',
                              hintStyle: TextStyle(color: Colors.brown)),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        shadows: [
                          Shadow(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              blurRadius: 20),
                        ],
                        //semanticLabel: String.fromCharCode(12),
                        size: 30,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        if (_messageController.text.isNotEmpty) {
                          sendMessage(_messageController.text);
                          _messageController.clear();
                        } else {
                          showDialog(
                            //barrierDismissible: true,
                            // barrierColor: Colors.amber,
                            // barrierLabel: String.fromCharCode(120),
                            //useRootNavigator: true,

                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                titleTextStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                backgroundColor:
                                    Color.fromARGB(255, 240, 213, 132),
                                title: Text('Error'),
                                content: Text(
                                  'Oops! Please write Something Bro....',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String message) {
    _databaseReference.push().set(
          'User:' + (message),
        );
  }
}
