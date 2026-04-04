import "./classes/Machine.dart";
import "./classes/Enums.dart";
import "./classes/Resources.dart";
import "./classes/coffee/ICoffee.dart";
import "./classes/coffee/Americano.dart";
import "./classes/coffee/Cappuccino.dart";
import "./classes/coffee/Espresso.dart";
import "./classes/coffee/Latte.dart";

import "dart:io";


void main() {
    Machine machine = Machine();

    bool running = true;

    print("Команды:");
    print("1 - приготовить кофе");
    print("2 - добавить ресурсы");
    print("3 - выход");

    while (running) {
        print("Введите команду: ");
        String? choice = stdin.readLineSync();

        switch (choice) {
            case '1':
                print("1 - Эспрессо");
                print("2 - Американо");
                print("3 - Капуччино");
                print("4 - Латте");
                String? choiceCoffee = stdin.readLineSync();
                ICoffee coffee = Espresso();
                switch (choiceCoffee) {
                    case '1':
                        coffee = Espresso();
                        break;

                    case '2':
                        coffee = Americano();
                        break;

                    case '3':
                        coffee = Cappuccino();
                        break;

                    case '4':
                        coffee = Latte();
                        break;    
                }
                if (machine.isAvailable(coffee)) {
                    machine.makeCoffeeByType(coffee);
                    print("Кофе \"${coffee.name()}\" готов");
                } else {
                    Resources currentResources = machine.getCurrentResources();
                    Resources needResources = machine.getNeedResources(coffee);
                    print("Не хватило ресурсов для напитка \"${coffee.name()}\": ");
                    print("- Кофейных зерен: ${currentResources.coffeeBeans}/${needResources.coffeeBeans} г");
                    print("- Молока: ${currentResources.milk}/${needResources.milk} мл");
                    print("- Воды: ${currentResources.water}/${needResources.water} мл");
                }
                break;

            case '2':
                print("Введите количество грамм кофейных зерен:");
                int coffeeBeans = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

                print("Введите количество милилитров молока:");
                int milk = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

                print("Введите количество милилитров воды:");
                int water = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

                machine.fillResources(Resources(
                    coffeeBeans: coffeeBeans,
                    milk: milk,
                    water: water
                ));
                break;
            
            case '3':
                running = false;
                break;
        }
        print("");
    }
}