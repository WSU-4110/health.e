import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String questionText;
  final List<Answer> answersList;
  final int level;

  Question(this.questionText, this.answersList, this.level);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  final int score;
  final int access;
  Answer(this.answerText, this.isCorrect, this.score, this.access);
}

void saveUserFitnessLevel(String userId, FitnessLevel level) {
  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .set({'level': level.index + 1}, SetOptions(merge: true));
}

int calculateScore(List<Answer> selectedAnswers) {
  int score = 0;
  for (Answer selectedAnswer in selectedAnswers) {
    for (Question question in getQuestions()) {
      if (question.answersList.contains(selectedAnswer)) {
        Answer correspondingAnswer = question.answersList.firstWhere(
            (answer) => answer.answerText == selectedAnswer.answerText);
        score += correspondingAnswer.score;
        break;
      }
    }
  }
  return score;
}

FitnessLevel determineFitnessLevel(int score) {
  if (score >= 12) {
    return FitnessLevel.Expert;
  } else if (score >= 8) {
    return FitnessLevel.Intermediate;
  } else {
    return FitnessLevel.Beginner;
  }
}

Future<void> updateUserLevel(String uid, int newLevel) async {
  // Get a reference to the user's document in the "users" collection
  final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

  // Update the "level" field of the user's document with the new level value
  await userDocRef.update({'level': newLevel});
}

void submitAnswers(List<Answer> selectedAnswers, String userId) {
  int score = calculateScore(selectedAnswers);
  FitnessLevel level = determineFitnessLevel(score);
  saveUserFitnessLevel(userId, level);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      "Within a 5 minute timeframe what level of cardio could you consistently do on foot?",
      [
        Answer("Walk with pauses", true, 1, 0),
        Answer("Jogging with some walking", true, 2, 0),
        Answer("Jog and/or running the entire time", true, 3, 0),
      ],
      0));

  list.add(Question(
      "Within a 5 minute timeframe what level of cardio could you consistently do on while swimming?",
      [
        Answer("Walk in the water with pauses", true, 1, 0),
        Answer("Swimming strokes with some pauses", true, 2, 0),
        Answer("Swimming strokes the entire time", true, 3, 0),
      ],
      0));

  list.add(Question(
      "Within a 5 minute timeframe what level of cardio could you consistently do while biking?",
      [
        Answer("Slow cycling with pauses", true, 1, 0),
        Answer("Casual cycling the entire time", true, 2, 0),
        Answer("Quick cycling the entire time", true, 3, 0),
      ],
      0));

  list.add(Question(
      "Within one minute how many sit ups could you consistently do?",
      [
        Answer("10 minus", true, 1, 0),
        Answer("11 to 20", true, 2, 0),
        Answer("21 plus", true, 3, 0),
      ],
      0));

  list.add(Question(
      "Within one minute how many push-ups could you consistently do?",
      [
        Answer("5 minus", true, 1, 0),
        Answer("6 to 15", true, 2, 0),
        Answer("16 plus", true, 3, 0),
      ],
      0));

  list.add(Question(
      "What is your access to a place to swim?",
      [
        Answer("I have no access", true, 0, 0),
        Answer("I can get access", true, 0, 1),
        Answer("I already have access", true, 0, 2),
      ],
      0));

  list.add(Question(
      "What is your access to a bike or cycle machine?",
      [
        Answer("I have no access", true, 0, 0),
        Answer("I can get access", true, 0, 1),
        Answer("I already have access", true, 0, 2),
      ],
      0));

  list.add(Question(
      "What is your access to weight machines like at a local fitness center?",
      [
        Answer("I have no access", true, 0, 0),
        Answer("I can get access", true, 0, 1),
        Answer("I already have access", true, 0, 2),
      ],
      0));

  return list;
}

FitnessLevel categorizeUser(int score) {
  if (score <= 6) {
    return FitnessLevel.Beginner;
  } else if (score <= 12) {
    return FitnessLevel.Intermediate;
  } else {
    return FitnessLevel.Expert;
  }
}

enum FitnessLevel {
  Beginner,
  Intermediate,
  Expert,
}
