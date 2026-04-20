import 'package:flutter/material.dart';


class ContentSection extends StatelessWidget {
  final List<Widget> children;

  const ContentSection({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Color(0xFFEBF1B0),
        padding: EdgeInsets.all(8),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: children
        )
      ),
    );
  }
}