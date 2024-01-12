class QuizQuestions {
  const QuizQuestions(this.text, this.options);
  final String text;
  final List<String> options;

  List<String> getShuffleOptions() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
