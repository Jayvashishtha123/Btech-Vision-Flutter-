import 'dart:io';

import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  User? _user;
  File? _image;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    User? user = _auth.currentUser;
    setState(() {
      _user = user;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Upload image to Firebase Storage
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_user != null && _image != null) {
      try {
        await _storage.ref('profile_images/${_user!.uid}.jpg').putFile(_image!);
      } on firebase_storage.FirebaseException catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            icon: Icon(CupertinoIcons.back)),
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/default_profile_image.jpg'),
                  )
                : CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(_image!),
                  ),
            SizedBox(height: 16),
            Text(
              _user != null ? _user!.displayName ?? '' : '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              _user != null ? _user!.email ?? '' : '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _pickImage(),
              child: Text('Change Profile Picture'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement the logic for signing out
                // For example, you can use FirebaseAuth to sign out the user
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
