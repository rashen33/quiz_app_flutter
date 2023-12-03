import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.onAction, required this.answerList});
  final Function(String value) onAction;
  final List<String> answerList;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': quesitons[i].question,
        'correct_answer': quesitons[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  int correctAnswers() {
    int correctAns = 0;
    for (var i = 0; i < answerList.length; i++) {
      if (quesitons[i].answers[0].toString() == answerList[i].toString()) {
        correctAns++;
      }
    }

    return correctAns;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: ListView(
        children: [
          Text(
            'Results',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${correctAnswers()} out of ${answerList.length} is Correct',
            textAlign: TextAlign.center,

            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 250, 193, 24),
            ),
          ),
          Center(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // Set cross axis alignment
              children: [
                ...getSummary().map(
                  (s) => SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            '${(s['questionIndex'] as int) + 1}. ${s['question']}',
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 37, 245, 47),
                            ),
                            'Correct Answer : ${s['correct_answer']}',
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 250, 246, 19),
                            ),
                            'Your Answer : ${s['user_answer']}',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
