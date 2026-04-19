import "package:coffee_machine_mobile/services/Resources.dart";
import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";


class Machine {
    final Resources _resources = Resources();

    void fillResources({int coffeeBeans = 0, int milk = 0, int water = 0, int cash = 0}) {
        _resources.coffeeBeans += coffeeBeans;
        _resources.milk += milk;
        _resources.water += water;
        _resources.cash += cash;
    }

    Resources getCurrentResources() => Resources(
        coffeeBeans: _resources.coffeeBeans,
        milk: _resources.milk,
        water: _resources.water,
        cash: _resources.cash
    );

    bool isAvailable(ICoffee coffee) {
        return _resources.coffeeBeans >= coffee.coffeeBeans() && _resources.milk >= coffee.milk() && _resources.water >= coffee.water();
    }

    void _makeCoffee(ICoffee coffee) {
        _resources.coffeeBeans -= coffee.coffeeBeans();
        _resources.milk -= coffee.milk();
        _resources.water -= coffee.water();
    }

    void makeCoffeeByType(ICoffee coffee) {
        if (isAvailable(coffee)) {
            _makeCoffee(coffee);
        }
    }
}