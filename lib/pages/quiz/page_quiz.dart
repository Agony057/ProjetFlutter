import 'package:flutter/material.dart';
import 'package:quizzflutter/entities/Question.dart';
import 'package:quizzflutter/entities/Quiz.dart';
import 'package:quizzflutter/pages/quiz/widgets/row_question.dart';
import 'package:quizzflutter/pages/quiz/widgets/row_qcm.dart';
import 'package:quizzflutter/routes/pages.dart';

class PageQuiz extends StatefulWidget {
  const PageQuiz({Key? key}) : super(key: key);

  @override
  State<PageQuiz> createState() => _PageQuizState();
}

class _PageQuizState extends State<PageQuiz> {
  late final TextEditingController controller;
  bool coloring = false;
  String selectedProposition = "";

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.getTitre()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: (() {
            // utilisation d'une fonction anonyme pour savoir si on affiche les questions ou le score
            if (quiz.numQuestion == quiz.getSizeQuestions()) {
              return Column(
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
              );
            } else {
              return Column(
                children: [
                  if (quiz.numQuestion < quiz.getSizeQuestions())
                    RowQuestion(
                        question: quiz.getQuestions()[quiz.numQuestion]),
                  if (quiz
                          .getQuestions()[quiz.numQuestion]
                          .getSizeProposition() ==
                      0)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                                labelText: 'Ecrire la réponse ici'),
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              final usersAnswer =
                                  controller.text.toUpperCase().trim();

                              if (usersAnswer !=
                                      quiz
                                          .getQuestions()[quiz.numQuestion]
                                          .getReponse() &&
                                  quiz.essai < 2) {
                                quiz.essai += 1;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "La réponse est ${quiz.getQuestions()[quiz.numQuestion].getReponse()}"),
                                  ),
                                );
                              } else {
                                if (quiz.essai == 0) {
                                  quiz.score += 1;
                                } else if (quiz.essai == 1) {
                                  quiz.score += 0.5;
                                }
                                quiz.numQuestion += 1;

                                controller.clear();
                                quiz.essai = 0;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  if (quiz
                          .getQuestions()[quiz.numQuestion]
                          .getSizeProposition() >
                      0)
                    Column(
                      children: [
                        for (final String item in quiz
                            .getQuestions()[quiz.numQuestion]
                            .proposition)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: InkWell(
                              onTap: () {
                                selectedProposition = item;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: coloring
                                      ? Colors.blue
                                      : Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(item),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (selectedProposition !=
                                        quiz
                                            .getQuestions()[quiz.numQuestion]
                                            .getReponse() &&
                                    quiz.essai < 2) {
                                  // La réponse est incorrecte
                                  quiz.essai += 1;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "La réponse est ${quiz.getQuestions()[quiz.numQuestion].getReponse()}"),
                                    ),
                                  );
                                } else {
                                  // La réponse est incorrecte
                                  if (quiz.essai == 0) {
                                    quiz.score += 1;
                                  } else if (quiz.essai == 1) {
                                    quiz.score += 0.5;
                                  }
                                  quiz.numQuestion += 1;

                                  quiz.essai = 0;
                                  setState(() {});
                                }
                              },
                              child: const Text("VALIDER"),
                            )
                          ],
                        ),
                      ],
                    )
                ],
              );
            }
          }()),
        ),
      ),
    );
  }
}
