import 'package:flutter/material.dart';
import 'package:lab5/infinity_list.dart';
import 'package:lab5/infinity_math_list.dart';
import 'package:lab5/simple_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Списки',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Список элементов'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(text: "Простой список",),
              Tab(text: "Номер строк",),
              Tab(text: "Степени двойки",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SimpleList(),
            InfinityList(),
            InfinityMathList(),
          ],
        )
      ),
    );
  }
}
