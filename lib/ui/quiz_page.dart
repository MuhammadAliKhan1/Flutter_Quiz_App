import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<QuizPage> {
  int count = 0, correct = 0;
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
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

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
              _getRaisedButton(
                color: Colors.green,
                text: 'True',
                function: () {
                  _checkAnswer(true);
                },
              ),
              SizedBox(
                height: 8,
              ),
              _getRaisedButton(
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

  _getRaisedButton({Color color, String text, Function function}) {
    return RaisedButton(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      onPressed: function,
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
            return AlertDialog(
              title: Text("🎉 Quiz Completed 🎉"),
              content: Text("Your score is $correct"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              actions: <Widget>[
                _getRaisedButton(
                    text: "Try again?",
                    color: Colors.green,
                    function: () {
                      setState(() {
                        iconList.clear();
                        count = 0;
                        correct = 0;
                        Navigator.pop(context);
                      });
                    }),
              ],
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

class Question {
  String question;
  bool correctAnswer;

  //Constructor
  Question(this.question, this.correctAnswer);
}
