import 'package:flutter/material.dart';
import 'package:quizzflutter/entities/Quiz.dart';
import 'package:quizzflutter/routes/pages.dart';

class RowQuiz extends StatelessWidget {
  const RowQuiz({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Pages.quiz,
            arguments: quiz,
          );
        },
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
                child: Text(quiz.getTitre()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
