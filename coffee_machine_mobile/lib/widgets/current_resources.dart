import 'package:flutter/material.dart';


class CurrentResources extends StatelessWidget {
  final int coffeeBeans;
  final int milk;
  final int water;
  static Color textColor = Color(0xFF777F21);

  const CurrentResources({super.key, this.coffeeBeans = 0, this.milk = 0, this.water = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Кофейные зерна: $coffeeBeans гр", style: TextStyle(color: textColor)),
        Text("Молоко: $milk мл", style: TextStyle(color: textColor)),
        Text("Вода: $water мл", style: TextStyle(color: textColor))
      ],
    );
  }
}