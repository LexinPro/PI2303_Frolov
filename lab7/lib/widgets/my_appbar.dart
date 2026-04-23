import 'package:flutter/material.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key, required this.title});

  final String title;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      title: Text(
        title,
      ),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}