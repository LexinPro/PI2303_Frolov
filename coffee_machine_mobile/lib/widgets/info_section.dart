import 'package:flutter/material.dart';


class InfoSection extends StatelessWidget {
  final List<Widget> children;

  const InfoSection({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        color: Color(0xFFCDDC39),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
      )
    );
  }
}