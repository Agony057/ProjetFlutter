import 'package:flutter/material.dart';
import 'package:quizzflutter/pages/list/list_quiz.dart';
import 'package:quizzflutter/pages/quiz/page_quiz.dart';
import 'package:quizzflutter/routes/pages.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: Pages.list,
      routes: {
        Pages.list: (context) => const ListQuiz(),
        Pages.quiz: (context) => const PageQuiz(),
      },
      // home: SnackBarPage(),
    );
  }
}
