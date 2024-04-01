import 'package:btech_vision/chatting/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageSearchDelegate extends SearchDelegate<String> {
  Future<List<String>> getUsernamesFromFirebase() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('messages').get();

    List<String> usernames = [];

    for (var doc in querySnapshot.docs) {
      String? sender = doc['sender'];

      if (sender != null) {
        usernames.add(sender);
      }
    }

    usernames = usernames.toSet().toList();

    return usernames;
  }

  @override
  String get searchFieldLabel => 'Search messages by username';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ChatScreen()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: getUsernamesFromFirebase(),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final results = snapshot.data!
            .where((username) =>
                username.toLowerCase().contains(query!.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(results[index]),
              onTap: () {
                close(context, results[index]);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  void showResults(BuildContext context) {
    close(context, query);
  }
}
