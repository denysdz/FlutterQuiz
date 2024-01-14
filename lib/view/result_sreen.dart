import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_day/data/quiz_question.dart';
import 'package:my_day/view/question_summary.dart';

class ResultScreenWidget extends StatelessWidget {

  const ResultScreenWidget({super.key, required this.answersResult, required this.onRestart});
 
  final List<String> answersResult; 
  final void Function() onRestart; 

  List<Map<String, Object>> getSummaryList () {
    List<Map<String, Object>> summaryList = [];

    for (int i=0; i<answersResult.length; i++) {
      summaryList.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": answersResult[i], 
      });
    }

    return summaryList;
  }

  @override
  Widget build (context) {
    final summaryData = getSummaryList();
    final allQuestionsCount = summaryData.length;
    final correctAnswersCount = summaryData.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;


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
                    "You answer $correctAnswersCount out of $allQuestionsCount question correctly",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SummaryQuestionWidget(summaryData: getSummaryList()),
                   const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: onRestart,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.restart_alt, color: Colors.white),
                        const SizedBox(width: 8.0), // Adjust the spacing as needed
                        Text(
                          "Restart button",
                           style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                           ),
                        ),
                      ],
                   ),
                )
              ],
            ),
          ),
        ),
      ),
    );
 
  }

}