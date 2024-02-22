import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: FutureBuilder(
        future: getUserProfile(user!.uid),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            // Set initial values for controllers
            nameController.text = data['name'];
            emailController.text = data['email'];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Update user profile
                    updateProfile(user.uid, {
                      'name': nameController.text,
                      'email': emailController.text,
                    });

                    // Show a snackbar or navigate to another screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Profile updated successfully!'),
                      ),
                    );
                  },
                  child: Text('Update Profile'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  // Update user profile
  Future<void> updateProfile(String uid, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set(data);
  }

  // Get user profile
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(String uid) {
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }
}
