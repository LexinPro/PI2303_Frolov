import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";
import "package:coffee_machine_mobile/services/enums.dart";


class Espresso implements ICoffee {
  @override
  CoffeeType type() => CoffeeType.espresso;

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