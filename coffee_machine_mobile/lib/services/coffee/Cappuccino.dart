import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";
import "package:coffee_machine_mobile/services/enums.dart";


class Cappuccino implements ICoffee {
  @override
  CoffeeType type() => CoffeeType.cappuccino;

  @override
  String name() => "Капучино";
  
  @override
  int coffeeBeans() => 50;

  @override
  int milk() => 100;

  @override
  int water() => 100;

  @override
  int cash() => 200;
}