class Question {
  final String question;
  final String reponse;
  final List<String> proposition;

  Question(this.proposition, {required this.question, required this.reponse});

  String getQuestion() {
    return question;
  }

  String getReponse() {
    return reponse;
  }

  List<String> getProposition() {
    return proposition;
  }

  int getSizeProposition() {
    return proposition.length;
  }
}
