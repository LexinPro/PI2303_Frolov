import "package:coffee_machine_mobile/services/async_methods.dart";
import "package:coffee_machine_mobile/services/Machine.dart";
import "package:coffee_machine_mobile/services/machine_view.dart";
import "package:coffee_machine_mobile/services/enums.dart";
import "package:coffee_machine_mobile/services/Resources.dart";
import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";
import "package:coffee_machine_mobile/services/coffee/Americano.dart";
import "package:coffee_machine_mobile/services/coffee/Cappuccino.dart";
import "package:coffee_machine_mobile/services/coffee/Espresso.dart";
import "package:coffee_machine_mobile/services/coffee/Latte.dart";

import "dart:io";


class MachineController {
    AsyncMethods process = AsyncMethods();
    final Machine machine;
    final MachineView view = MachineView();

    MachineController({required this.machine});

    Future<bool> runWork() async {
        bool running = true;
        view.showCommandMenu();
        String? choice = stdin.readLineSync();

        switch (choice) {
        case '1':
            await _makeCoffee();
            break;

        case '2':
            _addResources();
            break;
        
        case '3':
            running = false;
            break;
        }
        view.printMessage("");
        return running;
    }

    Future<void> _makeCoffee() async {
        view.showCoffeeMenu();

        String? choiceCoffee = stdin.readLineSync();
        CoffeeType? coffeeType = _parseCoffee(choiceCoffee);
        if (coffeeType == null) return;
        ICoffee coffee = _selectTypeCoffee(coffeeType);

        if (machine.isAvailable(coffee)) {
            machine.makeCoffeeByType(coffee);
            await _processMakingCoffee(coffee.milk() > 0);
            view.printCoffeeIsReady(coffee.name());
        } else {
            Resources currentResources = machine.getCurrentResources();
            view.showResourcesForCoffee(
                coffeeName: coffee.name(),
                currentCoffeeBeans: currentResources.coffeeBeans,
                currentMilk: currentResources.milk,
                currentWater: currentResources.water,
                needCoffeeBeans: coffee.coffeeBeans(),
                needMilk: coffee.milk(),
                needWater: coffee.water()
            );
        }
    }

    CoffeeType? _parseCoffee(String? choiceCoffee) {
        switch (choiceCoffee) {
            case '1': return CoffeeType.espresso;
            case '2': return CoffeeType.americano;
            case '3': return CoffeeType.cappuccino;
            case '4': return CoffeeType.latte;
        }
        return null;
    }


    ICoffee _selectTypeCoffee(CoffeeType coffeeType) {
        switch (coffeeType) {
            case CoffeeType.espresso: return Espresso();
            case CoffeeType.americano: return Americano();
            case CoffeeType.cappuccino: return Cappuccino();
            case CoffeeType.latte: return Latte();
        }
    }

    Future<void> _processMakingCoffee(bool withMilk) async {
        await process.heatWater();
        if (withMilk) {
            await Future.wait([
                process.brewCoffee(),
                process.beatMilk()
            ]);
            await process.mix();
        } else {
            await process.brewCoffee();
        }
    }

    void _addResources() {
        view.printMessage("Введите количество грамм кофейных зерен:");
        int coffeeBeans = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        view.printMessage("Введите количество милилитров молока:");
        int milk = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        view.printMessage("Введите количество милилитров воды:");
        int water = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        machine.fillResources(
          coffeeBeans: coffeeBeans,
          milk: milk,
          water: water
        );
    }
}