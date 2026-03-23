import "./classes/Machine.dart";

import "dart:io";


void main() {
    Machine machine = Machine();

    bool running = true;

    print("Команды:");
    print("1 - приготовить эспрессо");
    print("2 - добавить ресурсы");
    print("3 - выход");

    while (running) {
        print("Введите команду: ");
        String? choice = stdin.readLineSync();

        switch (choice) {
            case '1':
                if (machine.isAvailable()) {
                    machine.makingCoffee();
                    print("Эспрессо готов!");
                } else {
                    print("Недостаточно ресурсов");
                }
                break;

            case '2':
                print("Добавляем ресурсы. Для отмены введите \"Выход\".");

                int coffeeBeans = machine.coffeeBeans;
                print("Кофейные зерна (сейчас: ${coffeeBeans} гр):");
                coffeeBeans += int.tryParse(stdin.readLineSync() ?? "") ?? 0;
                machine.coffeeBeans = coffeeBeans;

                int milk = machine.milk;
                print("Молоко (сейчас: ${milk} мл):");
                milk += int.tryParse(stdin.readLineSync() ?? "") ?? 0;
                machine.milk = milk;

                int water = machine.water;
                print("Вода (сейчас: ${water} мл):");
                water += int.tryParse(stdin.readLineSync() ?? "") ?? 0;
                machine.water = water;

                break;
            
            case '3':
                running = false;
                break;
        }
        print("");
    }
}