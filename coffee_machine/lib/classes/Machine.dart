class Machine {
    static const ESPRESSO_COFFEE_BEANS = 50;
    static const ESPRESSO_MILK = 0;
    static const ESPRESSO_WATER = 100;

    int _coffeeBeans = 0;
    int _milk = 0;
    int _water = 0;

    int get coffeeBeans => _coffeeBeans;
    int get milk => _milk;
    int get water => _water;

    set coffeeBeans(int coffeeBeans) {
        if (coffeeBeans >= 0) {
            _coffeeBeans = coffeeBeans;
        }
    }

    set milk(int milk) {
        if (milk >= 0) {
            _milk = milk;
        }
    }

    set water(int water) {
        if (water >= 0) {
            _water = water;
        }
    }

    bool isAvailable() {
        return _coffeeBeans >= ESPRESSO_COFFEE_BEANS && _milk >= ESPRESSO_MILK && _water >= ESPRESSO_WATER;
    }

    void _subtractResources({ int coffeeBeans = ESPRESSO_COFFEE_BEANS, int milk = ESPRESSO_MILK, int water = ESPRESSO_WATER }) {
        _coffeeBeans -= coffeeBeans;
        _milk -= milk;
        _water -= water;
    }

    void makingCoffee() {
        if (isAvailable()) {
            _subtractResources();
        }
    }
}