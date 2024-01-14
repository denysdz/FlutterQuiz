import 'package:flutter/material.dart';
import 'package:my_day/view/question_screen.dart';
import 'package:my_day/view/result_sreen.dart';
import 'package:my_day/view/start_screen.dart';
import 'package:my_day/data/quiz_question.dart';
import 'package:my_day/view/result_sreen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }

}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? currenScreen; 

  void fillAnswer (String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        currenScreen = ResultScreenWidget(answersResult: selectedAnswers, onRestart: onRestart);
      });
    }
  }

  void onRestart () {
    setState(() {
       selectedAnswers = [];
       currenScreen = StartScreenWidget(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    currenScreen = StartScreenWidget(switchScreen);
  }

  void switchScreen () {
    setState(() {
      currenScreen = QuestionScreenWidget(answerFunction: fillAnswer);
    });
  }

  @override
  Widget build (context) {
    return MaterialApp(
      home: currenScreen,
     );
  }

}