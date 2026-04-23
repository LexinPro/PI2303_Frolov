import 'package:flutter/material.dart';
import 'package:lab7/screens/choice_screen.dart';
import 'package:lab7/widgets/my_appbar.dart';
import 'package:lab7/widgets/my_button.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Возвращение значения"),
      body: Center(
        child: MyButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChoiceScreen()),
            );
            if (result != null) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$result"),
                ),
              );
            }
          },
          text: "Приступить к выбору",
        ),
      )
    );
  }
}