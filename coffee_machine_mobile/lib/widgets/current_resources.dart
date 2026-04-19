import 'package:flutter/material.dart';


class CurrentResources extends StatelessWidget {
  const CurrentResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Кофейные зерна: 250 гр", style: TextStyle(color: Color(0xFF777F21))),
        Text("Молоко: 25 мл", style: TextStyle(color: Color(0xFF777F21))),
        Text("Вода: 250 мл", style: TextStyle(color: Color(0xFF777F21)))
      ],
    );
  }
}