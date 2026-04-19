import "package:coffee_machine_mobile/services/coffee/ICoffee.dart";
import "package:coffee_machine_mobile/services/enums.dart";


class Americano implements ICoffee {
  @override
  CoffeeType type() => CoffeeType.americano;

  @override
  String name() => "Американо";

  @override
  int coffeeBeans() => 50;

  @override
  int milk() => 0;

  @override
  int water() => 150;

  @override
  int cash() => 180;
}