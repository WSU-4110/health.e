import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 60, 2, 83),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(children: [
            const Text(
              "Assessment Demo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ]),
        ));
  }
}

_questionWidget() {
  List<Question> questionList = getQuestions();
  int currentQuestion = 0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Question ${currentQuestion + 1}/${questionList.length.toString()}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          questionList[currentQuestion].questionText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
    ],
  );
}

_answerList() {
  List<Question> questionList = getQuestions();
  int currentQuestion = 0;

  return Column(
    children: questionList[currentQuestion]
        .answersList
        .map(
          (e) => _answerButton(e),
        )
        .toList(),
  );
}

Widget _answerButton(Answer answer) {
  Answer? selectedAnswer;
  int score = 0;

  bool isSelected = answer == selectedAnswer;
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    height: 48,
    child: ElevatedButton(
      child: Text(answer.answerText),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: isSelected ? Colors.orangeAccent : Colors.white,
        onPrimary: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () {
        if (selectedAnswer == null) {
          if (answer.isCorrect) {
            score++;
          }
        }
        setState(() {
          selectedAnswer = answer;
        });
      },
    ),
  );
}

_nextButton() {
  List<Question> questionList = getQuestions();
  int currentQuestion = 0;

  bool isLastQuestion = false;
  if (currentQuestion == questionList.length - 1) {
    isLastQuestion = true;
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.5,
    height: 48,
    child: ElevatedButton(
        child: Text("Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {}),
  );
}
