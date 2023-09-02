import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const Answer({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          backgroundColor: const Color.fromARGB(112, 0, 136, 255),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(text),
    );
  }
}
