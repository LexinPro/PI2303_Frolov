import "./Resources.dart";


class Machine {
    static const ESPRESSO_COFFEE_BEANS = 50;
    static const ESPRESSO_MILK = 0;
    static const ESPRESSO_WATER = 100;

    Resources _resources = Resources();

    bool isAvailable() {
        return _resources.coffeeBeans >= ESPRESSO_COFFEE_BEANS && _resources.milk >= ESPRESSO_MILK && _resources.water >= ESPRESSO_WATER;
    }

    void _subtractResources({ int coffeeBeans = ESPRESSO_COFFEE_BEANS, int milk = ESPRESSO_MILK, int water = ESPRESSO_WATER }) {
        _resources.coffeeBeans -= coffeeBeans;
        _resources.milk -= milk;
        _resources.water -= water;
    }

    void makingCoffee() {
        if (isAvailable()) {
            _subtractResources();
        }
    }
}