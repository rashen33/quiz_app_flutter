class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  get cast => null;

  List<String> getRandomAnswers() {
    final randomAnswers = List.of(answers); //Mutating the answers
    randomAnswers.shuffle();
    return randomAnswers;
  }
}
