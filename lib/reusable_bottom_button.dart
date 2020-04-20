import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
          ),
        ),
        color: Colors.red,
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}
