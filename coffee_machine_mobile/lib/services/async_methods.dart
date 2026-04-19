class AsyncMethods {
    Future<void> heatWater() async {
        print("Начало нагрева воды");
        await Future.delayed(Duration(seconds: 3));
        print("Вода закипела");
    }

    Future<void> brewCoffee() async {
        print("Начало заваривания кофе");
        await Future.delayed(Duration(seconds: 5));
        print("Кофе заварен");
    }

    Future<void> beatMilk() async {
        print("Начало взбивания молока");
        await Future.delayed(Duration(seconds: 5));
        print("Молоко взбенено");
    }

    Future<void> mix() async {
        print("Начало смешивания кофе с молоком");
        await Future.delayed(Duration(seconds: 3));
        print("Кофе и молоко смешены");
    }
}