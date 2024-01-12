import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  List<String> selectedOption = [];
  void chooseAnswer(String option) {
    selectedOption.add(option);

    if (selectedOption.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  var activeScreen =
      'start-screen'; //We have created a identifier for ternery condition. Here identifier means the variable which we are going to use for checking condition like if , else.

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);

  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();

      activeScreen =
          'questions-screen'; // here we have reintialized the identifier to questions-scrren. This statement execute when user clicks on button.
    });
  }

  @override
  Widget build(context) {
    void onRestart() {
      setState(() {
        selectedOption = [];
        activeScreen = 'start-screen';
      });
    }

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        onRestart: onRestart,
        choosenOptions: selectedOption,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 4, 71, 133),
                  Color.fromARGB(255, 58, 169, 248)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
