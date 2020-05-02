import 'package:flutter/material.dart';
import 'package:quiz_app/common/button.dart';
import 'package:quiz_app/common/complete_dialog.dart';
import 'package:quiz_app/resource/models/question_model.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int count = 0, correct = 0;
  Function resetFunction;
  final tickIcon = Icon(
    Icons.check,
    color: Colors.green,
  );
  final crossIcon = Icon(
    Icons.clear,
    color: Colors.red,
  );
  //List if icons is added to the bottom of the screen
  List<Icon> iconList = [];

  final List<Question> questionsList = [
    Question(
        question: 'Some cats are actually allergic to humans',
        correctAnswer: true),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        correctAnswer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        correctAnswer: true),
    Question(question: 'A slug\'s blood is green.', correctAnswer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        correctAnswer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        correctAnswer: true),
    Question(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        correctAnswer: false),
    Question(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        correctAnswer: true),
    Question(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        correctAnswer: false),
    Question(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        correctAnswer: true),
    Question(
        question: 'Google was originally called \"Backrub\".',
        correctAnswer: true),
    Question(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        correctAnswer: true),
    Question(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it QuizPage to eat.',
        correctAnswer: true),
  ];
  @override
  void initState() {
    resetFunction = () {
      setState(() {
        iconList.clear();
        count = 0;
        correct = 0;
        Navigator.pop(context);
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    //First Column
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: Column(
        //Divide the vertical space between the children
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //Stretch the children horizontally to the screen size as we need to stretch the buttons
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            //Text widget with some padding
            child: Padding(
              padding: const EdgeInsets.only(
                top: 110,
                left: 20,
                right: 20,
              ),
              child: Text(
                questionsList[count].question,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Button(
                color: Colors.green,
                text: 'True',
                function: () {
                  _checkAnswer(true);
                },
              ),
              SizedBox(
                height: 8,
              ),
              Button(
                color: Colors.red,
                text: 'False',
                function: () {
                  _checkAnswer(false);
                },
              ),
              Container(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: iconList,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _checkAnswer(bool selectedAnswer) {
    // Check if don't cross list size limit which will result in error
    if (count < questionsList.length - 1) {
      count++;
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CompleteDialog(
              correct: correct,
              count: count,
              iconList: iconList,
              resetFunction: resetFunction,
            );
          });
    }

    if (selectedAnswer == questionsList[count].correctAnswer) {
      //Correct answer
      setState(() {
        iconList.add(tickIcon);
        correct++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconList.add(crossIcon);
      });
    }
  }
}
