import 'package:flutter/material.dart';
import 'package:flutter_quiz/response.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onRespond;

  const Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.onRespond,
    super.key,
  });

  bool get hasQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> response = hasQuestionSelected
        ? questions[selectedQuestion]['response'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Question(questions[selectedQuestion]['text'] as String),
        ...response.map((resp) {
          return Response(
            resp['text'] as String,
            () => onRespond(resp['score'] as int),
          );
        })
      ],
    );
  }
}
