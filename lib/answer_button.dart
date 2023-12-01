import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.value, required this.onAnswer});

  final String value;
  final Function() onAnswer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.blue[300],
        ),
        onPressed: onAnswer,
        autofocus: true,
        child: Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
