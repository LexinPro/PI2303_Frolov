import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/info_section.dart';
import 'package:coffee_machine_mobile/screens/coffee_maker/screen_content_section.dart';
import 'package:coffee_machine_mobile/widgets/current_resources.dart';


class CoffeeMakerScreen extends StatelessWidget {
  const CoffeeMakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoSection( children: [
          CurrentResources(),
          ScreenContentSection()
        ])
      ],
    );
  }
}