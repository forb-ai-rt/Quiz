import 'package:flutter/material.dart';
import 'package:mobilicis/data/question.dart';
import 'package:mobilicis/question_screen.dart';
import 'package:mobilicis/result_screen.dart';
import 'package:mobilicis/screen_side.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = "start_screen";
  switchScreen() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Screen_side(switchScreen);
    if (activeScreen == "question_screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result_screen") {
      screenWidget = Result_screen(chosenAnswer:selectedAnswer);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
