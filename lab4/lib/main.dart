import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Общежития КубГАУ',
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _like = false;

  void _pressLikeButton() {
    setState(() {
      _like = !_like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4CB050),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight(700),
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.asset("lib/assets/obshaga.jpg"),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text("Общежитие №20"),
                  subtitle: Text("Краснодар, ул. Калинина, 13"),
                  trailing: IconButton(
                    icon: Icon(_like ? Icons.favorite : Icons.favorite_border),
                    color: _like ? Colors.red : Colors.black,
                    onPressed: _pressLikeButton,
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        iconColor: Color(0xFF4CB050),
                        iconSize: 30,
                        foregroundColor: Color(0xFF4CB050),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.phone),
                          Text("ПОЗВОНИТЬ"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        iconColor: Color(0xFF4CB050),
                        iconSize: 30,
                        foregroundColor: Color(0xFF4CB050),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.near_me),
                          Text("МАРШРУТ"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        iconColor: Color(0xFF4CB050),
                        iconSize: 30,
                        foregroundColor: Color(0xFF4CB050),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.share),
                          Text("ПОДЕЛИТЬСЯ"),
                        ],
                      ),
                    ),
                  ]
                ),
                const SizedBox(height: 15,),
                Text("Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
