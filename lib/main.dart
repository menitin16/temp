import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding (
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            )
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{
  List<Icon> scorekeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  List<bool> answers = [
    false,
    true,
    true,
  ];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                primary: Colors.white,
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  questionNumber++;
                });
              },
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                primary: Colors.white,
                backgroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  scorekeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                  questionNumber++;
                });
              },
              child: const Text('False'),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }

}
