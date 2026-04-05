class MachineView {
    void showCommandMenu() {
        print("1 - приготовить кофе");
        print("2 - добавить ресурсы");
        print("3 - выход");
    }

    void showCoffeeMenu() {
        print("1 - Эспрессо");
        print("2 - Американо");
        print("3 - Капуччино");
        print("4 - Латте");
    }

    void printCoffeeIsReady(String name) {
        print("Напиток \"${name}\" приготовлен!");
    }

    void showResourcesForCoffee({
        String coffeeName,
        int currentCoffeeBeans,
        int currentMilk,
        int currentWater,
        int needCoffeeBeans,
        int needMilk,
        int needWater
    }) {
        print("Не хватило ресурсов для напитка \"${coffeeName}\": ");
        print("- Кофейные зерна: ${currentCoffeeBeans}/${needCoffeeBeans} г");
        print("- Молоко: ${currentMilk}/${needMilk} мл");
        print("- Вода: ${currentWater}/${needWater} мл");
    }

    void printMessage(String message) {
        print(message);
    }
}