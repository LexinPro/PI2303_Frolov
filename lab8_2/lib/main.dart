import 'package:flutter/material.dart';
import 'package:lab8_2/widgets/my_appbar.dart';
import 'package:lab8_2/widgets/news_list.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Лента КубГАУ",
      home: Scaffold(
        appBar: MyAppbar(title: "Новостная лента КубГАУ"),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: NewsList(),
        ),
      ),
    );
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}