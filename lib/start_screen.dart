import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});
  final void Function() changeScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),

          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: changeScreen,
            icon: const Icon(Icons.arrow_forward_ios),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
