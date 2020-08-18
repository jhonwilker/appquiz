import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  
  final String text;
  final void Function() onSelect;

  Answer(this.text,this.onSelect);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(text),
        onPressed: onSelect,
      ),
    );
  }
}