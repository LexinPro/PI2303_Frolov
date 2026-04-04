import "./ICoffee.dart";


class Latte implements ICoffee {
  @override
  int coffeeBeans() => 50;

  @override
  int milk() => 200;

  @override
  int water() => 100;

  @override
  int cash() => 250;
}