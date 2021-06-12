import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetQuiz;

  Result(this.finalScore, this.resetQuiz);

  String get resultText {
    var defaultText = 'Finished! Your score is: ';
    return defaultText + finalScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
