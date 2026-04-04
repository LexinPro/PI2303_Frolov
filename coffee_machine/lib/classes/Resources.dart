class Resources {
    int _coffeeBeans = 1000;
    int _milk = 1000;
    int _water = 1000;
    int _cash = 1000;

    Resources(this._coffeeBeans, this._milk, this._water, this._cash);

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