import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Send message
Future<void> sendMessage(String text) async {
  User? user = FirebaseAuth.instance.currentUser;
  String? username;

  if (user != null) {
    // Extract username from email
    username = user.email?.split('@')[0];
  }

  await FirebaseFirestore.instance.collection('messages').add({
    'text': text,
    'sender': username, // Use the username instead of email
    'timestamp': FieldValue.serverTimestamp(),
  });
}

// Get messages
Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
  return FirebaseFirestore.instance
      .collection('messages')
      .orderBy('timestamp')
      .snapshots();
}
