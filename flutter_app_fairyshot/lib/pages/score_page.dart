import 'package:flutter/material.dart';
import 'package:flutter_app_fairyshot/Home.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {


  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    ScoreFinal.Scorefin = ScoreFinal.Scorefin + score ;
    return new Material(
      color: Colors.indigo[400],
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            new Text("Votre Score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(score.toString() + "/" + totalQuestions.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
         ButtonLancer()
        ],
      )
    );
  }
}