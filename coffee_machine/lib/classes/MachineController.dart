class MachineController {
    Machine machine;
    MachineView view;

    MachineController(this.machine, this.view);

    bool runWork() {
        bool running = true;
        view.showCommandMenu();
        String? choice = stdin.readLineSync();

        switch (choice) {
        case '1':
            _makeCoffee();
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

    void _makeCoffee() {
        view.showCoffeeMenu();

        String? choiceCoffee = stdin.readLineSync();
        CoffeeType? coffeeType = _parseCoffee(choiceCoffee);
        if (coffeeType == null) return;
        ICoffee coffee = _selectTypeCoffee(coffeeType);

        if (machine.isAvailable(coffee)) {
            machine.makeCoffeeByType(coffee);
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

    void _addResources() {
        view.printMessage("Введите количество грамм кофейных зерен:");
        int coffeeBeans = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        view.printMessage("Введите количество милилитров молока:");
        int milk = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        view.printMessage("Введите количество милилитров воды:");
        int water = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        machine.fillResources(Resources(
            coffeeBeans: coffeeBeans,
            milk: milk,
            water: water
        ));
    }
}