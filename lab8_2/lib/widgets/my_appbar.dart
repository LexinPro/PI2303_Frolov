import 'package:flutter/material.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(15, 55);

  final String title;

  const MyAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF4CB050),
      title: Text(title),
    );
  }

}