import "./Resources.dart";
import "./coffee/ICoffee.dart";
import "./coffee/Americano.dart";
import "./coffee/Cappuccino.dart";
import "./coffee/Espresso.dart";
import "./coffee/Latte.dart";
import "./Enums.dart";


class Machine {
    Resources _resources = Resources();

    void fillResources(Resources resources) {
        _resources.coffeeBeans += resources.coffeeBeans;
        _resources.milk += resources.milk;
        _resources.water += resources.water;
        _resources.cash += resources.cash;
    }

    Resources getCurrentResources() => Resources(
        coffeeBeans: _resources.coffeeBeans,
        milk: _resources.milk,
        water: _resources.water,
        cash: _resources.cash
    );

    Resources getNeedResources(ICoffee coffee) {
        Resources resources = Resources(
            coffeeBeans: coffee.coffeeBeans(),
            milk: coffee.milk(),
            water: coffee.water(),
            cash: coffee.cash()
        );
        return resources;
    }

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