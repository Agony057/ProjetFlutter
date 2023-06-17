import 'package:flutter/material.dart';
import 'package:quizzflutter/entities/Question.dart';
import 'package:quizzflutter/entities/Quiz.dart';
import 'package:quizzflutter/routes/pages.dart';

class RowQuestion extends StatelessWidget {
  const RowQuestion({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(question.getQuestion()),
            ),
          ],
        ),
      ),
    );
  }
}
