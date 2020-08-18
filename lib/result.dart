import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() whenRebootQuiz;

  Result(this.pontuacao, this.whenRebootQuiz);

  String get fraseResultado {
    if (pontuacao < 130) {
      return 'Congratulations!!';
    } else if (pontuacao < 170) {
      return 'You are good!!';
    } else {
      return 'Are you Jedi?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          textColor: Colors.blue,
          onPressed: whenRebootQuiz,
          child: Text(
            'Reiniciar',
            style: TextStyle(fontSize: 25),
          ),
        )
      ],
    );
  }
}
