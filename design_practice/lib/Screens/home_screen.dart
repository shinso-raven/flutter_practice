import 'package:design_practice/components/card_child.dart';
import 'package:design_practice/components/reusable_card.dart';
import 'package:design_practice/constants.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? gender;
  double height = 120;
  int age = 18;
  int weight = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    gender = Gender.male;
                  });
                },
                color: gender != Gender.male
                    ? kInactiveCardColor
                    : kActiveCardColor,
                cardChild: CardChild(icon: Icons.male, label: "MALE"),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    gender = Gender.female;
                  });
                },
                color: gender != Gender.female
                    ? kInactiveCardColor
                    : kActiveCardColor,
                cardChild: CardChild(icon: Icons.female, label: "FEMALE"),
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text("cm")
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTickMarkColor: Color(0xff8d8e98),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29eb1555),
                            // thumbShape:
                            //     RoundSliderOverlayShape(overlayRadius: 15),
                            overlayShape:
                                RoundSliderThumbShape(enabledThumbRadius: 20),
                            thumbColor: Color(0xffeb1555)),
                        child: Slider(
                            value: height,
                            min: 120,
                            max: 220,
                            onChanged: (value) {
                              setState(() {
                                height = value.roundToDouble();
                              });
                            }),
                      )
                    ],
                  ))),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                      color: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "$age",
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyRoundButton(
                                icon: Icons.remove,
                                onPressed: () {},
                              ),
                              MyRoundButton(
                                icon: Icons.add,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ))),
              Expanded(
                  child: ReusableCard(
                      color: kInactiveCardColor,
                      cardChild: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              "$weight",
                              style: kLabelTextStyle,
                            ),
                            Row(
                              children: [
                                MyRoundButton(
                                  icon: Icons.remove,
                                  onPressed: () {},
                                ),
                                MyRoundButton(
                                  icon: Icons.add,
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                      )))
            ],
          )),
          BottomButton(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(color: Color(0xffeb1555)),
        child: Center(
          child: Text("CALCULATE", style: kLabelTextStyle),
        ),
      ),
    );
  }
}

class MyRoundButton extends StatelessWidget {
  const MyRoundButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 20,
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
    );
  }
}
