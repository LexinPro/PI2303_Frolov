import 'package:coffee_machine_mobile/services/Machine.dart';
import 'package:flutter/material.dart';


class FillResourcesContainer extends StatefulWidget {
  final VoidCallback onUpdate;
  final Machine machine;

  const FillResourcesContainer({super.key, required this.machine, required this.onUpdate});

  @override
  State<StatefulWidget> createState() => _FillResourcesContainerState();
}


class _FillResourcesContainerState extends State<FillResourcesContainer> {
  final TextEditingController coffeeController = TextEditingController();
  final TextEditingController milkController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  final TextEditingController cashController = TextEditingController();

  @override
  void dispose() {
    coffeeController.dispose();
    milkController.dispose();
    waterController.dispose();
    cashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: coffeeController,
            decoration: InputDecoration(labelText: "Кофейные зерна (гр)"),
          ),
          TextField(
            controller: milkController,
            decoration: InputDecoration(labelText: "Молоко (мл)"),
          ),
          TextField(
            controller: waterController,
            decoration: InputDecoration(labelText: "Вода (мл)"),
          ),
          TextField(
            controller: cashController,
            decoration: InputDecoration(labelText: "Деньги (руб)"),
          ),
          SizedBox(height: 15),
          IconButton(
            icon: Icon(Icons.add),
            style: IconButton.styleFrom(
              iconSize: 35,
              backgroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            onPressed: () {
              final coffee = int.tryParse(coffeeController.text) ?? 0;
              final milk = int.tryParse(milkController.text) ?? 0;
              final water = int.tryParse(waterController.text) ?? 0;
              final cash = int.tryParse(cashController.text) ?? 0;

              widget.machine.fillResources(
                coffeeBeans: coffee,
                milk: milk,
                water: water,
                cash: cash,
              );

              coffeeController.clear();
              milkController.clear();
              waterController.clear();
              cashController.clear();

              widget.onUpdate();
            },
          )
        ],
      )
    );
  }
}