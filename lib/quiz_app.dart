import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
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
          child: const StartScreen(),
        ),
      ),
    );
  }
}
