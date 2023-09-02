// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:mobilicis/data/question.dart';
import 'package:mobilicis/question_summary.dart';
import 'package:mobilicis/quiz.dart';
import 'package:mobilicis/style_text.dart';

// ignore: must_be_immutable, camel_case_types
class Result_screen extends StatelessWidget {
  const Result_screen({
    super.key,
    required this.chosenAnswer,
  });

  final List<String> chosenAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      bool isCorrect = chosenAnswer[i] == question[i].answers[0];
      summary.add(
        {
          'question_index': i,
          'question': question[i].text,
          'correct_answer': question[i].answers[0],
          'user_answer': chosenAnswer[i],
          'is_correct': isCorrect,
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQn = question.length;
    final numCorrectQn = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyleText(
              text:
                  "Your answered $numCorrectQn out of $numTotalQn questions corrected!",
            ),
            const SizedBox(height: 30),
            QuestionSummary(
              summarydata: summaryData,
              isCorrectList: summaryData
                  .map((data) => data['is_correct'] as bool)
                  .toList(),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Quiz()));
              },
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh_outlined),
                    Text("Restart Quiz!")
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
