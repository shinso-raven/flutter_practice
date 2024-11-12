import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoll extends StatefulWidget {
  const DiceRoll({
    super.key,
  });

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  var currentDice = 2;

  void rollDice() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/dice-$currentDice.png', width: 200),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: GestureDetector(
            onTap: () {
              rollDice();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              width: double.infinity,
              height: 40,
              child: Center(
                  child: Text(
                "Roll dice",
                style: TextStyle(fontSize: 28),
              )),
            ),
          ),
        )
      ],
    );
  }
}
