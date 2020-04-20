import 'package:flutter/material.dart';

class ReusableRoundButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  ReusableRoundButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(
        icon,
        color: Color(0xFFfffdd0),
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
    );
  }
}
