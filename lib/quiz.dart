import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/screens/question_screen.dart';
import 'package:quiz_app_flutter/screens/result_screen.dart';
import 'package:quiz_app_flutter/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectedAnswer = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(
  //     onAction: onScreenChange,
  //   );
  //   super.initState();
  // }

  void onScreenChange(String value) {
    setState(() {
      //when ever the set state is called the build method will be called again
      activeScreen = value;
    });
  }

  void onAnswerSelect(String anwswer) {
    selectedAnswer.add(anwswer);
    if (selectedAnswer.length == quesitons.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart(String value) {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen;

    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }

    if (activeScreen == 'quiz') {
      currentScreen =
          QuestionScreen(onAnswer: onAnswerSelect, onAction: onScreenChange);
    }

    if (activeScreen == 'result') {
      currentScreen = ResultScreen(onAction: onRestart);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff607d8b), Color(0xff3f51b5)],
              stops: [0.25, 0.75],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
