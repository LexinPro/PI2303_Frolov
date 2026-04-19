import 'package:coffee_machine_mobile/screens/coffee_maker/coffee_choice_container.dart';
import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/info_section.dart';
import 'package:coffee_machine_mobile/screens/coffee_maker/screen_content_section.dart';
import 'package:coffee_machine_mobile/widgets/current_resources.dart';
import 'package:coffee_machine_mobile/services/Machine.dart';
import 'package:coffee_machine_mobile/services/machine_controller.dart';


class CoffeeMakerScreen extends StatefulWidget {
  final Machine machine;

  const CoffeeMakerScreen({super.key, required this.machine});

  @override
  State<StatefulWidget> createState() => _CoffeeMakerScreenState();
}


class _CoffeeMakerScreenState extends State<CoffeeMakerScreen> {
  late MachineController controller;

  @override
  void initState() {
    super.initState();
    controller = MachineController(machine: widget.machine);
  }

  @override
  Widget build(BuildContext context) {
    final resources = controller.machine.getCurrentResources();

    return Column(
      children: [
        InfoSection(
          children: [
            CurrentResources(coffeeBeans: resources.coffeeBeans, milk: resources.milk, water: resources.water),
            ScreenContentSection(cash: resources.cash)
          ],
        ),
        CoffeeChoiceContainer(machine: widget.machine, onUpdate: () {setState(() {});})
      ],
    );
  }
}