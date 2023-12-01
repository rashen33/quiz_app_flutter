import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/answer_button.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Questions',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AnswerButton(value: 'Answer 1', onAnswer: () {}),
          AnswerButton(value: 'Answer 2', onAnswer: () {}),
          AnswerButton(value: 'Answer 3', onAnswer: () {}),
          AnswerButton(value: 'Answer 4', onAnswer: () {}),
          AnswerButton(value: 'Answer 5', onAnswer: () {}),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              onAction('start');
            },
            child: Text(
              '<< Back',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
