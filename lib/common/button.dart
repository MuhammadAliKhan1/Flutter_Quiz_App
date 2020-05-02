import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Function function;

  const Button({Key key, this.color, this.text, this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
}
