import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function handlePress;
  final String answerText;

  Answer(this.handlePress, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        disabledColor: Colors.indigo[100],
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(answerText),
        onPressed: handlePress,
      ),
    );
  }
}
