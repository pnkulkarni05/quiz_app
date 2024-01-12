import 'package:flutter/material.dart';
import 'package:quiz_app/summery_item.dart';

class QuestionsSummeryData extends StatelessWidget {
  const QuestionsSummeryData(this.summery, {super.key});
  final List<Map<String, Object>> summery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summery.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
