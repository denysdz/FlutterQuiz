import 'package:flutter/material.dart';

class RoundedText extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final TextStyle style;

  const RoundedText({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.style = const TextStyle(color: Colors.white, fontSize : 18.0),
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}