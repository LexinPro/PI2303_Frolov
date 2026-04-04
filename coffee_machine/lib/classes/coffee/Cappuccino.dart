import "./ICoffee.dart";


class Cappuccino implements ICoffee {
    @override
    int coffeeBeans() => 50;

    @override
    int milk() => 100;

    @override
    int water() => 100;

    @override
    int cash() => 200;
}