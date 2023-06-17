import 'package:quizzflutter/entities/Question.dart';

class Quiz {
  final String titre;
  final List<Question> questions;
  int numQuestion = 0;
  double score = 0;
  int essai = 0;

  Quiz({required this.titre, required this.questions});

  String getTitre() {
    return titre;
  }

  List<Question> getQuestions() {
    return questions;
  }

  int getSizeQuestions() {
    return questions.length;
  }

  remiseZero() {
    numQuestion = 0;
    score = 0;
    essai = 0;
  }
}
