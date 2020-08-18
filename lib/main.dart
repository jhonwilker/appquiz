import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';
import 'quiz.dart';

main() {
  runApp(new QuizApp());
}

class QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _questions = const [
    {
      'question': 'Whats is your favorite color?',
      'answer': [
        {'text': 'Blue', 'pontuacao': 1},
        {'text': 'Green', 'pontuacao': 2},
        {'text': 'Red', 'pontuacao': 3},
        {'text': 'Black', 'pontuacao': 4},
      ]
    },
    {
      'question': 'What is your favorite pet?',
      'answer': [
        {'text': 'Cat', 'pontuacao': 70},
        {'text': 'Dog', 'pontuacao': 20},
        {'text': 'Ferret', 'pontuacao': 30},
        {'text': 'Birdie', 'pontuacao': 10},
      ]
    },
    {
      'question': 'What is your favorite teacher?',
      'answer': [
        {'text': 'Liliam', 'pontuacao': 100},
        {'text': 'Mazé', 'pontuacao': 100},
        {'text': 'Marvin', 'pontuacao': 100},
        {'text': 'Bringel', 'pontuacao': 100},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  bool get haveQuestionSelect {
    return _perguntaSelecionada < _questions.length;
  }

  void _rebootQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miner',
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Quiz!",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: haveQuestionSelect
              ? Quiz(
                  perguntaSelecionada: _perguntaSelecionada,
                  questions: _questions,
                  responder: _responder,
                )
              : Result(_pontuacaoTotal, _rebootQuiz)),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  QuizAppState createState() {
    return QuizAppState();
  }
}
