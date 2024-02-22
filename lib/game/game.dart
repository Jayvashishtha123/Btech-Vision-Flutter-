import 'dart:math';

import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class GuessGame extends StatefulWidget {
  @override
  _GuessGameState createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  void _vibrate() async {
    // Check if the device supports vibration

    // Vibrate for 500 milliseconds
    Vibration.vibrate(duration: 500);
  }

  late int targetNumber;
  int attempts = 0;
  int? userGuess;
  String message = '';

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    targetNumber = Random().nextInt(100) + 1;
    attempts = 0;
    userGuess = null;
    message = '';
  }

  void checkGuess() {
    setState(() {
      attempts++;

      if (userGuess == null) {
        message = 'Please enter a valid number.';
      } else if (userGuess == targetNumber) {
        _vibrate();
        message =
            'Congratulations! You guessed the number in $attempts attempts.';
      } else if (userGuess! < targetNumber) {
        message = 'Try a higher number.';
      } else {
        message = ('Try a lower number.');
      }
    });
  }

  void resetGame() {
    setState(() {
      _vibrate();
      startGame();
    });
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
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.black,
        title: Text('Number Guessing Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Guess the number between 1 and 100:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  userGuess = int.tryParse(value);
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your guess',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              onPressed: checkGuess,
              child: Text('Check Guess'),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      const Color.fromARGB(255, 7, 32, 255))),
              onPressed: resetGame,
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
