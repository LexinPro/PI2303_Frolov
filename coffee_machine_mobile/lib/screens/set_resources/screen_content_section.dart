import 'package:coffee_machine_mobile/services/Machine.dart';
import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/content_section.dart';
import 'package:coffee_machine_mobile/widgets/current_money.dart';
import 'package:coffee_machine_mobile/widgets/current_resources.dart';


class ScreenContentSection extends StatelessWidget {
  final Machine machine;

  const ScreenContentSection({super.key, required this.machine});

  @override
  Widget build(BuildContext context) {
    final resources = machine.getCurrentResources();

    return ContentSection(
      children: [
        Text(
          "Ресурсы:",
          style: TextStyle(
            fontWeight: FontWeight(700),
            fontSize: 32
          ),
        ),
        CurrentResources(coffeeBeans: resources.coffeeBeans, milk: resources.milk, water: resources.water),
        CurrentMoney(cash: resources.cash)
      ]
    );
  }
}