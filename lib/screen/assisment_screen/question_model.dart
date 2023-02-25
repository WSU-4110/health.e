import 'dart:convert';

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      "Within a 5 minute timeframe what level of cardio could you consistently do?",
      [
        Answer("Walk with pauses", true),
        Answer("Walk the entire time", true),
        Answer("Jog with some walking", true),
        Answer("Jog the entire time", true),
        Answer("run with some walking or jogging", true),
        Answer("Run the entire time", true),
      ]));

  list.add(Question(
      "Within oen minute how many sit ups could you consistently do?", [
    Answer("5 minus", true),
    Answer("6 to 10", true),
    Answer("11 to 15", true),
    Answer("16 to 20", true),
    Answer("20 to 30", true),
  ]));

  list.add(Question(
      "Within oen minute how many knee push-ups could you consistently do?", [
    Answer("Knee push-ups 5 minus", true),
    Answer("Knee push-ups 5 to 10", true),
    Answer("Knee push-ups 11 to 15", true),
    Answer("Knee push-ups 16 to 20", true),
    Answer("Knee push-ups 21 to 30", true),
    Answer("Knee push-ups 30 plus", true),
  ]));

  list.add(Question(
      "Within oen minute how many push-ups could you consistently do?", [
    Answer("5 minus", true),
    Answer("6 to 10", true),
    Answer("11 to 15", true),
    Answer("16 to 20", true),
    Answer("21 to 30", true),
    Answer("30 plus", true),
  ]));

  return list;
}