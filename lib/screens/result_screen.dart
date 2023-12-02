import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.onAction, required this.answerList});
  final Function(String value) onAction;
  final List<String> answerList;

  
  List<Map<String,Object>> getSummary(){
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': quesitons[i].question,
        'correct_answer': quesitons[i].answers[0],
        'user_answer': answerList[i]
      });
    }

    return summary;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Result Screen',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...getSummary()
            .map(
              (s) => Text(((s['question'] as int) + 1).toString())),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 130,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue[300],
              ),
              onPressed: () {
                onAction('quiz');
              },
              autofocus: true,
              child: SizedBox(
                child: Text(
                  "Home",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
