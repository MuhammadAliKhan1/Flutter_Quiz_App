import 'package:flutter/material.dart';

class Question {
  final String question;
  final bool correctAnswer;

  Question({
    @required this.question,
    @required this.correctAnswer,
  });

  Question.fromMap(
    Map map,
  )   : question = map['question'] ?? null,
        correctAnswer = map['correctAnswer'] ?? null;

  Map<String, dynamic> toJson() => {
        "question": question,
        "correctAnswer": correctAnswer,
      };
}
