import 'package:flutter/material.dart';

class StartScreenWidget extends StatelessWidget {

  const StartScreenWidget(this.nextScreen, {Key? key}) : super(key: key);

  final void Function () nextScreen;

  static const titleTxt = "Learn Flutter the fun way!";
  static const btnTxt = "Start Quiz";

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/quiz-logo.png", width: 200, height: 200),
              const SizedBox(height: 25),
              const Text(
                titleTxt,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  )
              ),
              const SizedBox(height: 25),
              OutlinedButton.icon(
                onPressed: nextScreen,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  btnTxt,
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
                ),
              // Add more widgets if needed
            ],
          ),
        ),
      ),
    );
  }


}
