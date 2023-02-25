import 'dart:async';

import 'package:flutter/material.dart';
import 'question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  Answer? selectedAnswer;
  int score = 0;
  int currentQuestion = 0;
  List<Question> questionList = getQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
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

  // Widget for Displaying Question
  Widget _questionWidget() {
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
        const SizedBox(height: 20),
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

// Widget for Displaying Answers
  Widget _answerList() {

    return Column(
      children: questionList[currentQuestion]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
          .toList(),
    );
  }

// Widget for the "Next Button"
  Widget _nextButton() {

    // Boolean Validation for Last Question
    bool isLastQuestion = false;
    if (currentQuestion == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.blueAccent,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            _questionWidget();

            setState(() {
                    currentQuestion++;
            });

          },
          child: const Text("Next")),
    );
  }

  // Widget for Each Answer button
  Widget _answerButton(Answer answer) {

    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.orangeAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {

          if (selectedAnswer == null && answer.isCorrect) {
              score++;
            }

          setState(() {
            selectedAnswer = answer;
          });
        },
        child: Text(answer.answerText),
      ),
    );
  }
}






