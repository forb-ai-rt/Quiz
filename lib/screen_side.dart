// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mobilicis/style_text.dart';

class Screen_side extends StatelessWidget {
  const Screen_side(this.screen, {super.key});

  final void Function() screen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/quiz-logo.png",
              width: 300,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Opacity(
            opacity: 0.5,
            child: StyleText(text: "Learn flutter with Fun way!"),
          ),
          const SizedBox(
            height: 30,
          ),
          Opacity(
            opacity: 0.5,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(170, 10),
                shadowColor: Colors.black,
              ),
              onPressed:screen,
              icon: const Icon(Icons.arrow_right_alt),
              label: const StyleText(text: "Start Quiz"),
            ),
          ),
        ],
      ),
    );
  }
}
