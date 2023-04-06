
class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  final int score;
  Answer(this.answerText, this.isCorrect, this.score);
}


List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      "Within a 5 minute timeframe what level of cardio could you consistently do?",
      [
        Answer("Walk with pauses", true, 1),
        Answer("Walk the entire time", true, 2),
        Answer("Jog with some walking", true, 3),
      ]));

  list.add(Question(
      "Within oen minute how many sit ups could you consistently do?", [
    Answer("5 minus", true, 1),
    Answer("6 to 10", true, 2),
    Answer("11 to 15", true, 3),
  ]));

  list.add(Question(
      "Within oen minute how many knee push-ups could you consistently do?", [
    Answer("Knee push-ups 5 minus", true, 1),
    Answer("Knee push-ups 5 to 10", true, 2),
    Answer("Knee push-ups 11 to 15", true, 3),
  ]));

  list.add(Question(
      "Within oen minute how many push-ups could you consistently do?", [
    Answer("5 minus", true, 1),
    Answer("6 to 10", true, 2),
    Answer("11 to 15", true, 3),
  ]));

  return list;
}


