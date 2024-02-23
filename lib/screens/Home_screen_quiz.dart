import 'dart:async';

import 'package:btech_vision/screens/cse.dart';
import 'package:btech_vision/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizApp2 extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp2> {
  int _questionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  late Timer _timer = Timer(Duration.zero, () {});
  int _elapsedSeconds = 0;

  final List<Map<String, Object>> _questions = [
    // Computer Science and Engineering Questions
    {
      'questionText':
          'What is the primary focus of Computer Science and Engineering?',
      'answers': [
        {'text': 'Hardware Design', 'score': 0},
        {'text': 'Software Development', 'score': 1},
        {'text': 'Civil Construction', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which programming language is commonly associated with CSE?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Python', 'score': 1},
        {'text': 'C++', 'score': 0},
      ],
    },
    {
      'questionText': 'In CSE, what does "AI" stand for?',
      'answers': [
        {'text': 'Artificial Intelligence', 'score': 1},
        {'text': 'Advanced Interfaces', 'score': 0},
        {'text': 'Automated Imaging', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the significance of algorithms in Computer Science?',
      'answers': [
        {'text': 'Studying ancient scripts', 'score': 0},
        {'text': 'Problem-solving processes', 'score': 1},
        {'text': 'Chemical reactions', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which organization developed the C programming language?',
      'answers': [
        {'text': 'Microsoft', 'score': 0},
        {'text': 'IBM', 'score': 0},
        {'text': 'Bell Labs', 'score': 1},
      ],
    },

    // Electrical Engineering Questions
    {
      'questionText': 'What is the primary focus of Electrical Engineering?',
      'answers': [
        {'text': 'Building structures', 'score': 0},
        {'text': 'Power and electronics', 'score': 1},
        {'text': 'Environmental studies', 'score': 0},
      ],
    },
    {
      'questionText': 'Which unit is used to measure electrical resistance?',
      'answers': [
        {'text': 'Volt', 'score': 0},
        {'text': 'Ohm', 'score': 1},
        {'text': 'Ampere', 'score': 0},
      ],
    },
    {
      'questionText': 'In EE, what does "AC" stand for?',
      'answers': [
        {'text': 'Alternate Current', 'score': 1},
        {'text': 'Advanced Circuits', 'score': 0},
        {'text': 'Automated Control', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the purpose of a capacitor in electrical circuits?',
      'answers': [
        {'text': 'Store electrical charge', 'score': 1},
        {'text': 'Amplify signals', 'score': 0},
        {'text': 'Generate heat', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which scientist is known for contributions to electrical theory?',
      'answers': [
        {'text': 'Isaac Newton', 'score': 0},
        {'text': 'Nikola Tesla', 'score': 1},
        {'text': 'Marie Curie', 'score': 0},
      ],
    },

    // Mechanical Engineering Questions
    {
      'questionText': 'What is the primary focus of Mechanical Engineering?',
      'answers': [
        {'text': 'Network Security', 'score': 0},
        {'text': 'Thermal systems and machines', 'score': 1},
        {'text': 'Aerospace design', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which law describes the conservation of energy in mechanical systems?',
      'answers': [
        {'text': 'Newton\'s Law', 'score': 0},
        {'text': 'Einstein\'s Theory', 'score': 0},
        {'text': 'First Law of Thermodynamics', 'score': 1},
      ],
    },
    {
      'questionText':
          'What is the purpose of a gearbox in mechanical engineering?',
      'answers': [
        {'text': 'Generate electricity', 'score': 0},
        {'text': 'Amplify signals', 'score': 0},
        {'text': 'Control speed and torque', 'score': 1},
      ],
    },
    {
      'questionText':
          'Which material is commonly used in 3D printing for prototypes?',
      'answers': [
        {'text': 'Wood', 'score': 0},
        {'text': 'Plastic', 'score': 1},
        {'text': 'Glass', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the function of a camshaft in an internal combustion engine?',
      'answers': [
        {'text': 'Regulate temperature', 'score': 0},
        {'text': 'Convert heat to energy', 'score': 0},
        {'text': 'Control valve timing', 'score': 1},
      ],
    },

    // Civil Engineering Questions
    {
      'questionText': 'What is the primary focus of Civil Engineering?',
      'answers': [
        {'text': 'Software development', 'score': 0},
        {'text': 'Design and construction of infrastructure', 'score': 1},
        {'text': 'Genetic engineering', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which type of engineering involves surveying and land development?',
      'answers': [
        {'text': 'Biomedical Engineering', 'score': 0},
        {'text': 'Civil Engineering', 'score': 1},
        {'text': 'Chemical Engineering', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the primary function of a geotechnical engineer?',
      'answers': [
        {'text': 'Design computer networks', 'score': 0},
        {'text': 'Study the behavior of Earth materials', 'score': 1},
        {'text': 'Develop new medicines', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which construction material is known for its high compressive strength?',
      'answers': [
        {'text': 'Wood', 'score': 0},
        {'text': 'Concrete', 'score': 1},
        {'text': 'Plastic', 'score': 0},
      ],
    },
    {
      'questionText':
          'What is the purpose of a civil engineer in a bridge construction project?',
      'answers': [
        {'text': 'Write poetry', 'score': 0},
        {'text': 'Design chemical processes', 'score': 0},
        {'text': 'Ensure structural integrity and safety', 'score': 1},
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
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
                        color: const Color.fromARGB(255, 60, 64, 67),
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
      decoration: BoxDecoration(color: Colors.transparent),
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
            backgroundColor: const Color.fromARGB(255, 44, 41, 32)
            // Change the button color
            ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
