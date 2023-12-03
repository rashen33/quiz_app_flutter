import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/quiz.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await readJson();
  runApp(const Quiz());
}
