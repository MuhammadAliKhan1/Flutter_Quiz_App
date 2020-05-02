import 'package:flutter/material.dart';
import 'package:quiz_app/common/button.dart';

class CompleteDialog extends StatefulWidget {
  int correct;
  List<Icon> iconList;
  int count;
  Function resetFunction;
  CompleteDialog({
    Key key,
    @required this.correct,
    @required this.iconList,
    @required this.count,
    @required this.resetFunction,
  }) : super(key: key);

  @override
  _CompleteDialogState createState() => _CompleteDialogState();
}

class _CompleteDialogState extends State<CompleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("🎉 Quiz Completed 🎉"),
      content: Text("Your score is ${widget.correct}"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      actions: <Widget>[
        Button(
          text: "Try again?",
          color: Colors.green,
          function: widget.resetFunction,
        ),
      ],
    );
  }
}
