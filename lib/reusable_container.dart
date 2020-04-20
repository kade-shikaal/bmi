import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  //Function used on specific button with pressed
  final Function onTap;
  //Widget that is a child of the container
  final Widget childWidget;
  //The colour of the container
  final Color colour;

  //The constructor with parameters to be called
  ReusableContainer(
      {@required this.onTap, @required this.childWidget, this.colour});

  //GestureDetector allows the use of onTap property in order to use anonymous function;
  //BoxDecoration widget to change the colour of the container and border radius for circular edges;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
