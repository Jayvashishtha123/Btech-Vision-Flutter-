import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrollableList extends StatefulWidget {
  @override
  _ScrollableListState createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);
    return Container(
      width: 100,
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                Text('ndkjds'),
                Text('skdwjduwu'),
                Text('ndkjds'),
                Text('skdwjduwu'),
                Text('ndkjds'),
                Text('skdwjduwu'),
                Text('ndkjds'),
                Text('skdwjduwu'),
                Text('ndkjds'),
                Text('skdwjduwu'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _scrollToButtom();
            },
            child: Text('Scroll to Top'),
          ),
        ],
      ),
    );
  }

  void _scrollToButtom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 35),
      curve: Curves.ease,
    );
  }
}
