import 'package:dicec/dice_roll.dart';
import 'package:flutter/material.dart';

const begin = Alignment.topLeft;
const end = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  const GradientContainer.purple({super.key})
      : color1 = Colors.purple,
        color2 = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: begin, end: end, colors: [color1, color2])),
        child: Center(
          child: DiceRoll(),
        ),
      ),
    );
  }
}
