import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";


class Cappuccino implements ICoffee {
    @override
    String name() => "Капуччино";
    
    @override
    int coffeeBeans() => 50;

    @override
    int milk() => 100;

    @override
    int water() => 100;

    @override
    int cash() => 200;
}