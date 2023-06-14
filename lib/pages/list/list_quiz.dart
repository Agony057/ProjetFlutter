import 'package:flutter/material.dart';
import 'package:quizzflutter/entities/list_de_quiz.dart';
import 'package:quizzflutter/entities/Quiz.dart';
import 'package:quizzflutter/pages/list/widgets/row_quiz.dart';

class ListQuiz extends StatefulWidget {
  const ListQuiz({
    super.key,
  });

  @override
  State<ListQuiz> createState() => _ListQuizState();
}

class _ListQuizState extends State<ListQuiz> {
  late final TextEditingController controller;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('JEU DE QUIZ'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              for (final Quiz item in listQuiz)
                RowQuiz(
                  quiz: item,
                ),
              // for (final Pokemon item in pokedex)
              //   TheAmazingRow(
              //     icon: item.icon,
              //     label: item.name.toUpperCase(),
              //     onDelete: () => onPokemonDelete(item.name),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
