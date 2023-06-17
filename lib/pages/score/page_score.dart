import 'package:flutter/material.dart';
import 'package:quizzflutter/entities/Quiz.dart';

class PageScore extends StatelessWidget {
  const PageScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.getTitre()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                        "${quiz.score.toString()} / ${quiz.getQuestions().length}"),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      quiz.remiseZero();
                      Navigator.pop(context);
                    },
                    child: const Text("Retour Home"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
