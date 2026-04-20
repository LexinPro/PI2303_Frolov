import 'package:flutter/material.dart';


class TabButton extends StatelessWidget {
  final String fileName;
  final int size;

  const TabButton({super.key, required this.fileName, this.size = 34});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Image.asset('assets/$fileName', width: size.toDouble())
    );
  }
}