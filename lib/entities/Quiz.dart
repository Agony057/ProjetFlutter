import 'package:quizzflutter/entities/Question.dart';

class Quiz {
  final String titre;
  final List<Question> questions;
  final int numQuestion = 0;
  final int score = 0;

  Quiz({required this.titre, required this.questions});

  String getTitre() {
    return titre;
  }

  List<Question> getQuestions() {
    return questions;
  }
}
