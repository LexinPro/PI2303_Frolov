import 'package:flutter/material.dart';
import 'package:coffee_machine_mobile/services/async_methods.dart';
import 'package:coffee_machine_mobile/services/Machine.dart';
import 'package:coffee_machine_mobile/services/coffee/Cappuccino.dart';
import 'package:coffee_machine_mobile/services/coffee/Espresso.dart';
import 'package:coffee_machine_mobile/services/coffee/ICoffee.dart';
import 'package:coffee_machine_mobile/services/coffee/Latte.dart';
import 'package:coffee_machine_mobile/services/coffee/Americano.dart';


class CoffeeChoiceContainer extends StatefulWidget {
  final Machine machine;
  final VoidCallback onUpdate;

  const CoffeeChoiceContainer({super.key, required this.machine, required this.onUpdate});

  @override
  State<StatefulWidget> createState() => _CoffeeChoiceContainerState();
}

class _CoffeeChoiceContainerState extends State<CoffeeChoiceContainer> {
  final List<ICoffee> coffees = [
    Americano(),
    Cappuccino(),
    Espresso(),
    Latte()
  ];
  late ICoffee _selectedCoffee;

  @override
  void initState() {
    super.initState();
    _selectedCoffee = coffees.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RadioGroup<ICoffee>(
            groupValue: _selectedCoffee,
            onChanged: (ICoffee? coffee) {
              setState(() {
                _selectedCoffee = coffee!;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: coffees.map((coffee) {
                return Row(
                  children: [
                    Radio<ICoffee>(value: coffee),
                    Text(coffee.name())
                  ],
                );
              }).toList(),
            )
          ),
          IconButton(
            icon: Icon(Icons.play_arrow),
            style: IconButton.styleFrom(
              iconSize: 35,
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            onPressed: () async {
              if (widget.machine.isAvailable(_selectedCoffee)) {
                final AsyncMethods asyncMethods = AsyncMethods(onMessage: _onMessage);
                widget.machine.makeCoffeeByType(_selectedCoffee);
                await _processMakingCoffee(asyncMethods, _selectedCoffee.milk() > 0);
                widget.onUpdate();
              }
            },
          )
        ],
      )
    );
  }

  void _onMessage(String text) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }

  Future<void> _processMakingCoffee(AsyncMethods asyncMethods, bool withMilk) async {
    await asyncMethods.heatWater();
    if (withMilk) {
      await Future.wait([
        asyncMethods.brewCoffee(),
        asyncMethods.beatMilk()
      ]);
      await asyncMethods.mix();
    } else {
      await asyncMethods.brewCoffee();
    }
  }
}