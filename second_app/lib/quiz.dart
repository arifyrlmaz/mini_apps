import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/data/questions_data.dart';
import 'package:second_app/questions.dart';
import 'package:second_app/results_screen.dart';
import 'package:second_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quizstate();
  }
}

class _Quizstate extends State<Quiz> {
  var active_screen = "start-screen";
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      active_screen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        active_screen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (active_screen == "questions-screen") {
      screenWidget = Questions(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (active_screen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: switchScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 162, 0, 255),
              Color.fromARGB(255, 162, 0, 255)
            ])),
            child: screenWidget),
      ),
    );
  }
}
