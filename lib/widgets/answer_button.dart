import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.value, required this.onAnswer});

  final String value;
  final Function(String value) onAnswer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blue[300],
          ),
          onPressed: () {
            onAnswer(value);
          },
          autofocus: true,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
