import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BTechTaskPage extends StatefulWidget {
  @override
  _BTechTaskPageState createState() => _BTechTaskPageState();
}

class _BTechTaskPageState extends State<BTechTaskPage> {
  final CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('tasks');

  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 23, 23),
          title: Text("Your Tasks"),
        ),
        body: StreamBuilder(
          stream:
              taskCollection.where('userId', isEqualTo: _user.uid).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            List<String> tasks = snapshot.data!.docs.map((doc) {
              return doc['task'].toString();
            }).toList();

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 253, 254, 252),
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Handle task deletion
                        _deleteTask(snapshot.data!.docs[index].id);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 157, 152, 152),
          onPressed: () {
            // Handle adding a new task
            _showAddTaskDialog();
          },
          child: Icon(
            Icons.add,
            color: const Color.fromARGB(255, 255, 248, 248),
          ),
        ),
      ),
    );
  }

  void _showAddTaskDialog() {
    String newTask = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(hintText: 'Enter your task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle adding the new task
                _addTask(newTask);
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addTask(String task) async {
    await taskCollection.add({
      'userId': _user.uid,
      'task': task,
    });
  }

  Future<void> _deleteTask(String taskId) async {
    await taskCollection.doc(taskId).delete();
  }
}

void main() {
  runApp(MaterialApp(
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return BTechTaskPage();
        } else {
          return SignInPage();
        }
      },
    ),
  ));
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Sign in with Firebase authentication
            UserCredential userCredential =
                await FirebaseAuth.instance.signInAnonymously();

            runApp(MaterialApp(
              home: BTechTaskPage(),
            ));
          },
          child: Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}
