import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/info_section.dart';
import 'package:coffee_machine_mobile/screens/set_resources/screen_content_section.dart';


class SetResourcesScreen extends StatelessWidget {
  const SetResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoSection( children: [
          ScreenContentSection()
        ])
      ],
    );
  }
}