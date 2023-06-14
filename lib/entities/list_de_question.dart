import 'package:quizzflutter/entities/Question.dart';

final List<Question> listQuestionStarWars = [
  Question(
    [],
    question: "Comment s'appelle le robot que Anakin a construit ?",
    reponse: "c3po",
  ),
  Question(
    ["maitre yoda", "mace windu", "compte dookku"],
    question: "Comment s'appelle le maitre jedi qui parle à l'envers ?",
    reponse: "maitre yoda",
  ),
];

final List<Question> listQuestionSeigneurDesAnneaux = [
  Question(
    [],
    question: "Comment s'appelle le magicien gris",
    reponse: "gandalf",
  ),
  Question(
    ["smaug", "smaguld", "smeagol"],
    question: "Quel est le vrai nom de gollum",
    reponse: "smehagol",
  ),
];
