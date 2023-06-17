import 'package:quizzflutter/entities/list_de_question.dart';
import 'package:quizzflutter/entities/Quiz.dart';

final List<Quiz> listQuiz = [
  Quiz(
    titre: "QUIZ HARRY POTTER",
    questions: listQuestionHarryPotter,
  ),
  Quiz(
    titre: "QUIZ DISNEY",
    questions: listQuestionDisney,
  ),
];
