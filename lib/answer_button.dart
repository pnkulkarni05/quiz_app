import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.option, required this.onTap});

  final String option;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      onPressed: onTap,
      child: Text(
        option,
        textAlign: TextAlign.center,
      ),
    );
  }
}
