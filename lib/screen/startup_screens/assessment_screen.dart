import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/startup_screens/sign_up/sign_up_screen.dart';
import '../../common_widget/question_model.dart';
import '../../value/color.dart';


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

        body: Container(

          padding: const EdgeInsets.only(left: 15,right: 15,),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientColors_1, gradientColors_1],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Text(
                  "Assessment Demo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20,),
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
        Container(
          alignment: Alignment.center,
          child: Text(
            "Question ${currentQuestion + 1}/${questionList.length.toString()}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            //color: Colors.white,
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

    return InkWell(
      onTap: () {

        if(isLastQuestion==true){
          Get.off(()=>const SignUpScreen());
        }else{
          _questionWidget();

          setState(() {
            currentQuestion++;
          });
        }


      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 15, right: 15,top: 25),
        decoration: BoxDecoration(color: whiteColors, borderRadius: BorderRadius.circular(99)),
        child: Text(
          "Next",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal, color: gradientColors_1),
        ),
      ),
    );




  }

  // Widget for Each Answer button
  Widget _answerButton(Answer answer) {

    bool isSelected = answer == selectedAnswer;

    return InkWell(
      onTap: (){
        if (selectedAnswer == null && answer.isCorrect) {
          score++;
        }

        setState(() {
          selectedAnswer = answer;
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ?Colors.white :  gradientColors_1,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Colors.white,
                width: 2
            )
        ),
        child:Text(answer.answerText),
      ),
    );
  }
}
