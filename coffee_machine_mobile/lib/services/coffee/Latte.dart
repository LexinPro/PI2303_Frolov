import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";


class Latte implements ICoffee {
    @override
    String name() => "Латте";

    @override
    int coffeeBeans() => 50;

    @override
    int milk() => 200;

    @override
    int water() => 100;

    @override
    int cash() => 250;
}