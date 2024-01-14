import 'package:flutter/material.dart';
import 'package:my_day/data/quiz_question.dart';
import 'package:my_day/view/answer_btn.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreenWidget extends StatefulWidget {

  const QuestionScreenWidget({super.key, required this.answerFunction});

  final void Function(String answer) answerFunction;

  @override
  State<QuestionScreenWidget> createState () {
    return _QuestionScreenWidget();
  }

}

class _QuestionScreenWidget extends State<QuestionScreenWidget> { 
  var currentQuestionIndex = 0;

  void answerClick () {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 138, 28, 216), Color.fromARGB(255, 101, 28, 179)], // Customize gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                ),
                const SizedBox(height: 25),
                ...currentQuestion.getShuffleAnswers().map((txt) {
                  return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      child: AnswerBtnWidget(txt, () {
                        answerClick();
                        widget.answerFunction(txt);
                      })
                    );
                })                
              ],
            ),
          ),
        ),
      ),
    );
  }


}
