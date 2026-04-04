class Resources {
    int _coffeeBeans = 0;
    int _milk = 0;
    int _water = 0;
    int _cash = 0;

    int get coffeeBeans => _coffeeBeans;
    int get milk => _milk;
    int get water => _water;
    int get cash => _cash;

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

    set cash(int cash) {
        if (cash >= 0) {
            _cash = cash;
        }
    }
}