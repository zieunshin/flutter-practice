import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    // TODO: implement createState
    return  _DiceRollerState();
  }
}

// _로 시작하면 private class로서 다른 파일에서 import 해도 못 봄
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                'assets/images/dice-$currentDiceRoll.png',
                width : 200
                ),
                const SizedBox(height: 20),
                TextButton(onPressed: rollDice,
                style: TextButton.styleFrom(
                  // padding: const EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white, 
                  textStyle: const TextStyle(fontSize:20)),
                  child: const Text('Roll Dice'),
                )
              ],
            );
  }
}