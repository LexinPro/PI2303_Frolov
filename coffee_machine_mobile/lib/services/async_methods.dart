class AsyncMethods {
  final void Function(String) onMessage;

  const AsyncMethods({required this.onMessage});

  Future<void> heatWater() async {
    onMessage("Нагрев воды");
    await Future.delayed(const Duration(seconds: 3));
    onMessage("Вода закипела");
  }

  Future<void> brewCoffee() async {
    onMessage("Заваривание кофе");
    await Future.delayed(const Duration(seconds: 5));
    onMessage("Кофе заварен");
  }

  Future<void> beatMilk() async {
    onMessage("Начало взбивания молока");
    await Future.delayed(const Duration(seconds: 5));
    onMessage("Молоко взбито");
  }

  Future<void> mix() async {
    onMessage("Смешивание");
    await Future.delayed(const Duration(seconds: 3));
    onMessage("Готово");
  }
}