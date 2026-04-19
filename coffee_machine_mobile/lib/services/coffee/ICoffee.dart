import 'package:coffee_machine_mobile/services/enums.dart';

abstract class ICoffee {
  CoffeeType type();
  String name();
  int coffeeBeans();
  int milk();
  int water();
  int cash();
}