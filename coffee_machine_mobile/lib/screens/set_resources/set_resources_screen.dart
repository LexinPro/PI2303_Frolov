import 'package:coffee_machine_mobile/services/Machine.dart';
import 'package:coffee_machine_mobile/services/machine_controller.dart';
import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/info_section.dart';
import 'package:coffee_machine_mobile/screens/set_resources/screen_content_section.dart';


class SetResourcesScreen extends StatefulWidget {
  final Machine machine;

  const SetResourcesScreen({super.key, required this.machine});

  @override
  State<StatefulWidget> createState() => _SetResourcesScreen();
}


class _SetResourcesScreen extends State<SetResourcesScreen> {
  late MachineController controller;

  @override
  void initState() {
    super.initState();
    controller = MachineController(machine: widget.machine);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoSection( children: [
          ScreenContentSection(machine: controller.machine)
        ])
      ],
    );
  }
}