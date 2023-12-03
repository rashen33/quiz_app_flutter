import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/widgets/answer_button.dart';
import 'package:quiz_app_flutter/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.onAnswer, required this.onAction});
  final Function(String value) onAction;
  final Function(String value) onAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  
  void answerQuetion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 28),
            child: Text(
              textAlign: TextAlign.center,
              quesitons[currentIndex].question,
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ...quesitons[currentIndex]
              .getRandomAnswers()
              .map((answer) => AnswerButton(
                    value: answer,
                    onAnswer: answerQuetion,
                  )), //Getting the answers from the questions.dart file
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              widget.onAction(
                  'start'); //widget is used to access the onAction in QuestionScreen class
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
