import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_day/view/rounded_text_widget.dart';

class SummaryQuestionWidget extends StatelessWidget {

  const SummaryQuestionWidget({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  Color getUserAnswerColor(int index) {
    return summaryData[index]["user_answer"] == summaryData[index]["correct_answer"] ? Colors.green : Colors.red;
  }

  @override
  Widget build (BuildContext context) {
    
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: RoundedText(
                      text: ((data['question_index'] as int) + 1).toString(),
                      backgroundColor: getUserAnswerColor((data['question_index'] as int)),
                      style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                       const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data["question"] as String,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        data["user_answer"] as String,
                        style: GoogleFonts.lato(
                          color: getUserAnswerColor(data['question_index'] as int),
                          fontSize: 14,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: GoogleFonts.lato(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ],),
                  )
                ],
              ); 
            }
          ).toList(),
        ),
      ),
    );
  }

}