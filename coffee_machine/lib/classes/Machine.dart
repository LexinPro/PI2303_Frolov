class Machine {
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
        return _coffeeBeans >= 50 && _milk >= 0 && _water >= 100;
    }

    void _subtractResources({ int coffeeBeans = 50, int milk = 0, int water = 100 }) {
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