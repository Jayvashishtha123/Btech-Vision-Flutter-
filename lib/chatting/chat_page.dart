import 'package:btech_vision/chatting/functions.dart';
import 'package:btech_vision/chatting/search_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

const String hostEmail = 'jayvashishtha.agra@gmail.com';

Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e);
  }
}

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e);
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}

class ChatScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 60, 55),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/drawer');
            },
            icon: Icon(Icons.arrow_back_sharp)),
        title: const Text(
          'Chat with us!',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MessageSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: getMessages(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var message = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    String? email = message['sender'];
                    String? username = email?.split('@')[0];

                    Timestamp? timestamp = message['timestamp'];
                    DateTime? dateTime = timestamp?.toDate();
                    String time = dateTime != null
                        ? DateFormat('HH:mm').format(dateTime)
                        : 'N/A';

                    bool isHost = message['sender'] == "jayvashishtha.agra";

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: isHost
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isHost
                                ? Color(0xFFDCF8C6)
                                : (isHost
                                    ? const Color(0xFFDCF8C6)
                                    : const Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isHost
                                  ? const Color(0xFF128C7E)
                                  : (isHost
                                      ? const Color(0xFF128C7E)
                                      : const Color(0xFF075E54)),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${username ?? 'Unknown User'} - $time',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                message['text'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
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
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF075E54)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send,
                      size: 32, color: Color(0xFF075E54)),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      sendMessage(
                        messageController.text,
                      );
                      messageController.clear();
                    } else if (getCurrentUser() == null ||
                        getCurrentUser()?.email == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            titleTextStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: Colors.yellow,
                            title: Text('Error'),
                            content: const Text(
                              'First Login Bro....',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            titleTextStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: Colors.yellow,
                            title: Text('Error'),
                            content: const Text(
                              'Oops! Please write something Bro....',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
