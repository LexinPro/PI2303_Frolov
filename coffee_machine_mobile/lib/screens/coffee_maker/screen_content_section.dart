import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/content_section.dart';
import 'package:coffee_machine_mobile/widgets/current_money.dart';


class ScreenContentSection extends StatelessWidget {
  final int cash;

  const ScreenContentSection({super.key, required this.cash});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      children: [
        Text(
          "Coffee Maker",
          style: TextStyle(
            fontWeight: FontWeight(700),
            fontSize: 32
          ),
        ),
        CurrentMoney(cash: cash)
      ]
    );
  }
}