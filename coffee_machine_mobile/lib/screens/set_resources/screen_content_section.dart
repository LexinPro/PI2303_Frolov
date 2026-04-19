import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/content_section.dart';
import 'package:coffee_machine_mobile/widgets/current_money.dart';
import 'package:coffee_machine_mobile/widgets/current_resources.dart';


class ScreenContentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentSection(
      children: [
        Text(
          "Ресурсы:",
          style: TextStyle(
            fontWeight: FontWeight(700),
            fontSize: 32
          ),
        ),
        CurrentResources(),
        CurrentMoney()
      ]
    );
  }
}