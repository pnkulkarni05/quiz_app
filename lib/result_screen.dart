import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summery_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.choosenOptions,
  });
  final void Function() onRestart;
  final List<String> choosenOptions;
  List<Map<String, Object>> getSummeryData() {
    List<Map<String, Object>> summery = [];
    for (int i = 0; i < choosenOptions.length; i++) {
      summery.add({
        'questionIndex': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].options[0],
        'selectedOption': choosenOptions[i]
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final correctAnswers = summeryData
        .where((data) {
          return data['correctAnswer'] == data['selectedOption'];
        })
        .toList()
        .length;
    final int totalQuestions = questions.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "You have answered $correctAnswers out of $totalQuestions questions correctly"),
              const SizedBox(
                height: 20,
              ),
              QuestionsSummeryData(
                getSummeryData(),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  onRestart();
                },
                child: const Text(
                  "Restart Quiz!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
