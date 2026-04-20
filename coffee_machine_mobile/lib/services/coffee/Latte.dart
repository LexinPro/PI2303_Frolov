import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";
import "package:coffee_machine_mobile/services/enums.dart";


class Latte implements ICoffee {
  @override
  CoffeeType type() => CoffeeType.latte;

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