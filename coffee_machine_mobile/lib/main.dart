import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/widgets/tab_button.dart';
import 'package:coffee_machine_mobile/screens/coffee_maker/coffee_maker_screen.dart';
import 'package:coffee_machine_mobile/screens/set_resources/set_resources_screen.dart';
import 'package:coffee_machine_mobile/services/Machine.dart';


void main() {
  final machine = Machine();
  machine.fillResources(coffeeBeans: 300);

  runApp(MyApp(machine: machine));
}

class MyApp extends StatelessWidget {
  final Machine machine;

  const MyApp({super.key, required this.machine});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Machine',
      home: HomePage(machine: machine),
    );
  }
}

class HomePage extends StatefulWidget {
  final Machine machine;

  const HomePage({super.key, required this.machine});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final machine = widget.machine;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF795548),
          title: Text("Coffee Machine"),
          foregroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              TabButton(fileName: "coffee-cup.png"),
              TabButton(fileName: "delivery.png")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CoffeeMakerScreen(machine: machine),
            SetResourcesScreen(machine: machine),
          ],
        )
      )
    );
  }
}


