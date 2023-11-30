import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/result.dart';

void main() => runApp(const QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'response': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1},
      ],
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'response': [
        {'text': 'Coelho', 'score': 10},
        {'text': 'Cobra', 'score': 5},
        {'text': 'Elefante', 'score': 3},
        {'text': 'Leão', 'score': 1},
      ],
    },
    {
      'text': 'Qual é o seu instrutor favorito?',
      'response': [
        {'text': 'Leo', 'score': 10},
        {'text': 'Maria', 'score': 5},
        {'text': 'João', 'score': 3},
        {'text': 'Pedro', 'score': 1},
      ],
    }
  ];

  void _respond(int score) {
    if (hasQuestionSelected) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestionSelected {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
          body: hasQuestionSelected
              ? Quiz(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  onRespond: _respond,
                )
              : Result(_totalScore, _restartQuiz)),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
