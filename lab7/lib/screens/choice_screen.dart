import 'package:flutter/material.dart';
import 'package:lab7/widgets/my_appbar.dart';
import 'package:lab7/widgets/my_button.dart';


class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Выберите любой вариант"),
      body: Center(
        child: SizedBox(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyButton(
                onPressed: () {
                  Navigator.pop(context, "Да!");
                },
                text: "Да!",
              ),
              MyButton(
                onPressed: () {
                  Navigator.pop(context, "Нет.");
                },
                text: "Нет.",
              ),
            ],
          ),
        ),
      )
    );
  }
}