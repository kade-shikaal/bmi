import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_container.dart';
import 'reusable_icon.dart';
import 'resuable_round_button.dart';
import 'reusable_bottom_button.dart';
import 'results_page.dart';
import 'calculation.dart';

//Using enum for the selected gender container
enum Gender { Male, Female }

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  //Used to check which gender is selected from the enum
  Gender genderSelected;
  int weight = 60;
  int height = 160;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
        elevation: 5.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    //if the selected gender is male change container to activate
                    colour: genderSelected == Gender.Male
                        ? kActiveContainerColour
                        : kInactiveContainerColour,
                    childWidget: IconGender(
                      genderIcon: Icons.add,
                      genderText: "Male",
                    ),
                    onTap: () {
                      setState(() {
                        //Set the selected gender when container is pressed
                        genderSelected = Gender.Male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: genderSelected == Gender.Female
                        ? kActiveContainerColour
                        : kInactiveContainerColour,
                    childWidget: IconGender(
                      genderIcon: Icons.minimize,
                      genderText: "Female",
                    ),
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.Female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: kActiveContainerColour,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Color(0xFFfffdd0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveContainerColour,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT"),
                        Text(weight.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableRoundButton(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ReusableRoundButton(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveContainerColour,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE"),
                        Text(age.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableRoundButton(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ReusableRoundButton(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onTap: () {
              Calculation calc = Calculation(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
