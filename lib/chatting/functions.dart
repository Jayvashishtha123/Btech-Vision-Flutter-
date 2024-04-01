import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendMessage(String text) async {
  User? user = FirebaseAuth.instance.currentUser;
  String? username;

  if (user != null) {
    username = user.email?.split('@')[0];
  }

  await FirebaseFirestore.instance.collection('messages').add({
    'text': text,
    'sender': username,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
  return FirebaseFirestore.instance
      .collection('messages')
      .orderBy('timestamp')
      .snapshots();
}
