class Question {

  const Question(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffleAnswers () {
    final copyList = List.of(answers);
    copyList.shuffle();
    return copyList;
  }

}