import 'package:btech_vision/screens/cse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital ?',
      'answers': [
        {'text': 'Berlin', 'score': 0},
        {'text': 'Paris', 'score': 1},
        {'text': 'Madrid', 'score': 0},
      ],
    },
    {
      'questionText': 'Which programming language is Flutter based on?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Dart', 'score': 1},
        {'text': 'Python', 'score': 0},
      ],
    },
    {
      'questionText': 'What does "UI" stand for?',
      'answers': [
        {'text': 'User Interaction', 'score': 0},
        {'text': 'User Interface', 'score': 1},
        {'text': 'Underline Italic', 'score': 0},
      ],
    },
    {
      'questionText': 'What does "CSE" stand for?',
      'answers': [
        {'text': 'Computer Society of engineering', 'score': 0},
        {'text': 'Computer Science and Engineering', 'score': 1},
        {'text': 'Common Science enterance ', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      // Move to the next question
      print('Next question!');
    } else {
      // Quiz completed, show the final score
      print('Quiz completed! Final Score: $_score');
      // You can display the final score using a dialog, navigate to a new screen, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => cse()));
            },
            child: Icon(CupertinoIcons.back)),
        backgroundColor: Colors.amber,
        title: Center(child: Text('Quiz')),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionText:
                  _questions[_questionIndex]['questionText'] as String,
              answers: _questions[_questionIndex]['answers']
                  as List<Map<String, Object>>,
              answerHandler: _answerQuestion,
            )
          : Center(
              child: Text(
                'Quiz completed!\nYour Final Score: $_score',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function(int) answerHandler;

  Quiz({
    required this.questionText,
    required this.answers,
    required this.answerHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText),
        ...answers.map((answer) => Answer(
              text: answer['text'] as String,
              onPressed: () => answerHandler(answer['score'] as int),
            )),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  Answer({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
