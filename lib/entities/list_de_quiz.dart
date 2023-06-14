import 'package:quizzflutter/entities/list_de_question.dart';
import 'package:quizzflutter/entities/Quiz.dart';

final List<Quiz> listQuiz = [
  Quiz(
    titre: "QUIZ STAR WARS",
    questions: listQuestionStarWars,
  ),
  Quiz(
    titre: "QUIZ SEIGNEUR DES ANNEAUX",
    questions: listQuestionSeigneurDesAnneaux,
  ),
];
