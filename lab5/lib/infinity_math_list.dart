import 'package:flutter/material.dart';
import 'dart:math';


class InfinityMathList extends StatelessWidget {
  const InfinityMathList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text("2 ^ $index = ${pow(2, index)}");
      },
    );
  }
}