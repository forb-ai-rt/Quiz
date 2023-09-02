import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summarydata,
    required this.isCorrectList,
  });

  final List<Map<String, Object>> summarydata;
  final List<bool> isCorrectList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.asMap().entries.map((entry) {
            final index = entry.key;
            final data = entry.value;
            final isCorrect = isCorrectList[index];
            final Color numberColor = isCorrect
                ? const Color.fromARGB(255, 0, 149, 255)
                : const Color.fromARGB(255, 255, 110, 99);
            return Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: numberColor),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(data['question'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        data['correct_answer'] as String,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        data['user_answer'] as String,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
