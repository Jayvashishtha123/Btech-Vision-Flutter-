import 'dart:async';

import 'package:btech_vision/screens/cse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  late Timer _timer = Timer(Duration.zero, () {});
  int _elapsedSeconds = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What does "B.Tech" stand for?',
      'answers': [
        {'text': 'Bachelor of Technology', 'score': 1},
        {'text': 'Bachelor of Teaching', 'score': 0},
        {'text': 'Business Technology', 'score': 0},
      ],
    },
    {
      'questionText': 'Which engineering branch focuses on computer systems?',
      'answers': [
        {'text': 'Mechanical Engineering', 'score': 0},
        {'text': 'Computer Science and Engineering', 'score': 1},
        {'text': 'Electrical Engineering', 'score': 0},
      ],
    },
    {
      'questionText': 'In electronics, what does "LED" stand for?',
      'answers': [
        {'text': 'Long Energy Device', 'score': 0},
        {'text': 'Light Emitting Diode', 'score': 1},
        {'text': 'Logical Electronic Device', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the primary purpose of studying thermodynamics in B.Tech?',
      'answers': [
        {'text': 'Understand celestial bodies', 'score': 0},
        {'text': 'Study energy transfer in systems', 'score': 1},
        {'text': 'Create new programming languages', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which programming language is commonly used in B.Tech curriculum?',
      'answers': [
        {'text': 'Ruby', 'score': 0},
        {'text': 'C++', 'score': 1},
        {'text': 'Swift', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the fundamental unit of resistance in electrical circuits?',
      'answers': [
        {'text': 'Ohm', 'score': 1},
        {'text': 'Watt', 'score': 0},
        {'text': 'Ampere', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the purpose of a transistor in electronics?',
      'answers': [
        {'text': 'Amplify signals', 'score': 1},
        {'text': 'Store data', 'score': 0},
        {'text': 'Generate heat', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which engineering branch deals with the design and construction of buildings?',
      'answers': [
        {'text': 'Civil Engineering', 'score': 1},
        {'text': 'Aeronautical Engineering', 'score': 0},
        {'text': 'Chemical Engineering', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the primary function of a router in computer networks?',
      'answers': [
        {'text': 'Filter water', 'score': 0},
        {'text': 'Connect multiple networks', 'score': 1},
        {'text': 'Measure temperature', 'score': 0},
      ],
    },
    {
      'questionText': 'In B.Tech, what does "CAD" stand for?',
      'answers': [
        {'text': 'Computer-Aided Design', 'score': 1},
        {'text': 'Centralized Algorithmic Database', 'score': 0},
        {'text': 'Cybernetic Analysis Diagram', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the primary role of a chemical engineer?',
      'answers': [
        {'text': 'Build bridges', 'score': 0},
        {'text': 'Design chemical processes', 'score': 1},
        {'text': 'Write poetry', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which branch of engineering deals with the study of motion and forces?',
      'answers': [
        {'text': 'Biomedical Engineering', 'score': 0},
        {'text': 'Mechanical Engineering', 'score': 1},
        {'text': 'Environmental Engineering', 'score': 0},
      ],
    },
    {
      'questionText': 'What is the primary focus of aerospace engineering?',
      'answers': [
        {'text': 'Underwater exploration', 'score': 0},
        {'text': 'Study of Earth\'s atmosphere', 'score': 0},
        {
          'text': 'Design and development of aircraft and spacecraft',
          'score': 1
        },
      ],
    },
    {
      'questionText':
          'Which programming paradigm is associated with languages like Haskell and Lisp?',
      'answers': [
        {'text': 'Object-Oriented Programming', 'score': 0},
        {'text': 'Functional Programming', 'score': 1},
        {'text': 'Imperative Programming', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the primary use of Fourier analysis in engineering?',
      'answers': [
        {'text': 'Study of insects', 'score': 0},
        {'text': 'Analysis of periodic functions and signals', 'score': 1},
        {'text': 'Classification of rocks', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which material is commonly used as a semiconductor in electronics?',
      'answers': [
        {'text': 'Wood', 'score': 0},
        {'text': 'Silicon', 'score': 1},
        {'text': 'Aluminum', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the purpose of a feedback loop in control systems?',
      'answers': [
        {'text': 'Generate random signals', 'score': 0},
        {'text': 'Maintain or regulate the output of a system', 'score': 1},
        {'text': 'Create echoes in audio systems', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which engineering field focuses on the design and improvement of medical devices?',
      'answers': [
        {'text': 'Mechanical Engineering', 'score': 0},
        {'text': 'Biomedical Engineering', 'score': 1},
        {'text': 'Chemical Engineering', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the primary purpose of studying mathematics in B.Tech?',
      'answers': [
        {'text': 'Learn ancient languages', 'score': 0},
        {'text': 'Develop problem-solving skills', 'score': 1},
        {'text': 'Memorize historical events', 'score': 0},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds += 1;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _questionIndex += 1;
      _isAnswered = false;
    });

    if (_questionIndex < _questions.length) {
      // Move to the next question
      print('Next question!');
    } else {
      // Quiz completed, show the final score and time taken
      _stopTimer();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _elapsedSeconds = 0;
      _startTimer(); // Restart the timer
    });
  }

  @override
  void dispose() {
    _stopTimer(); // Ensure the timer is stopped when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 54, 82, 52),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => cse()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Quiz'),
          actions: [
            // Add any additional actions here
          ],
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _questionIndex < _questions.length
              ? Quiz(
                  key: ValueKey<int>(_questionIndex), // Ensure unique keys
                  questionText:
                      _questions[_questionIndex]['questionText'] as String,
                  answers: _questions[_questionIndex]['answers']
                      as List<Map<String, Object>>,
                  answerHandler: _answerQuestion,
                  isAnswered: _isAnswered,
                  onAnswered: () {
                    setState(() {
                      _isAnswered = true;
                    });
                  },
                )
              : Center(
                  key: ValueKey<String>('result'), // Ensure unique keys
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Quiz completed!\nYour Final Score: $_score',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text('Time taken: $_elapsedSeconds seconds'),
                      ElevatedButton(
                        onPressed: () {
                          _resetQuiz();
                        },
                        child: Text('Restart Quiz'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function(int) answerHandler;
  final bool isAnswered;
  final VoidCallback onAnswered;

  Quiz({
    required this.questionText,
    required this.answers,
    required this.answerHandler,
    required this.isAnswered,
    required this.onAnswered,
    Key? key, // Add a key parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText),
        // Display the answers
        ...answers.map(
          (answer) => Answer(
            text: answer['text'] as String,
            onPressed: isAnswered ? null : () => _handleAnswer(answer),
          ),
        ),
      ],
    );
  }

  void _handleAnswer(Map<String, Object> answer) {
    onAnswered();
    answerHandler(answer['score'] as int);
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  Answer({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(
              255, 139, 145, 150), // Change the button color
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: QuizApp(),
  ));
}
