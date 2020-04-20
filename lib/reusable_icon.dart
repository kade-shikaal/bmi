import 'package:flutter/material.dart';

class IconGender extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;

  IconGender({this.genderIcon, this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(genderText),
      ],
    );
  }
}
