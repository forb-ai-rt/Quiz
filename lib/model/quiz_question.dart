class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> get shuffleValue {
    final shuffleValue = List.of(answers);
    shuffleValue.shuffle();
    return shuffleValue;
  }
}
