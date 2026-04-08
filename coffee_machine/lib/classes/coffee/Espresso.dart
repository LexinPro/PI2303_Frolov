import "./ICoffee.dart";


class Espresso implements ICoffee {
    @override
    String name() => "Эспрессо";

    @override
    int coffeeBeans() => 50;
    
    @override
    int milk() => 0;

    @override
    int water() => 100;

    @override
    int cash() => 250;
}