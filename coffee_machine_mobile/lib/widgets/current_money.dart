import 'package:flutter/material.dart';


class CurrentMoney extends StatelessWidget {
  final int cash;

  const CurrentMoney({super.key, this.cash = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Баланс: $cash",
      style: TextStyle(
        color: Color(0xFF6D7052),
        fontSize: 20
      ),
    );
  }
}