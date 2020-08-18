import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Quiz({
    @required this.questions,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get haveQuestionSelect {
    return perguntaSelecionada < questions.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String,Object>> _answers =
        haveQuestionSelect ? questions[perguntaSelecionada]['answer'] : null;
        
    return Column(
      children: <Widget>[
        Question(questions[perguntaSelecionada]['question']),
        ..._answers
        .map((ans) => Answer(ans['text'], () => responder(ans['pontuacao'])))
        .toList(),
      ],
    );
  }
}
