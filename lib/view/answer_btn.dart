import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerBtnWidget extends StatelessWidget {

  const AnswerBtnWidget (this.answer, this.onClick, {super.key});

  final String answer;
  final void Function() onClick;

  @override
  Widget build (context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 39, 6, 62),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      );
  }

}