import 'package:flutter/material.dart';
import 'package:quizzflutter/entities/Quiz.dart';
import 'package:quizzflutter/pages/quiz/widgets/row_question.dart';

class PageQuiz extends StatelessWidget {
  const PageQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.getTitre()),
      ),
      body: Center(
        child: Column(
          children: [
            // Text(quiz.getQuestions()[0].getQuestion()),
            RowQuestion(question: quiz.getQuestions()[quiz.numQuestion])
          ],
        ),
      ),
    );
  }
}
