import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<String> createDeck(http.Client client) async {
  final response = await client.get(
    Uri.parse("https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"),
  );

  if (response.statusCode != 200) {
    throw Exception("Ошибка сети");
  }

  return parseResponseCreateDeck(response.body);
}

String parseResponseCreateDeck(String responseBody) {
  final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
  return parsed["deck_id"] as String;
}

Future<List<PlayingCard>> drawCards(http.Client client, String deckId) async {
  final response = await client.get(
    Uri.parse("https://deckofcardsapi.com/api/deck/$deckId/draw/?count=10"),
  );

  if (response.statusCode != 200) {
    throw Exception("Ошибка сети");
  }

  return parseResponseDrawCards(response.body);
}

List<PlayingCard> parseResponseDrawCards(String responseBody) {
  final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
  final List<dynamic> cardsJson = parsed["cards"] as List<dynamic>;

  return cardsJson
      .map<PlayingCard>(
        (json) => PlayingCard.fromJson(json as Map<String, dynamic>),
      )
      .toList();
}

Future<List<PlayingCard>> loadCards() async {
  final client = http.Client();

  try {
    final deckId = await createDeck(client);
    final cards = await drawCards(client, deckId);
    return cards;
  } finally {
    client.close();
  }
}


class PlayingCard {
  final String imageUrl;
  final String value;
  final String suit;

  PlayingCard({
    required this.imageUrl,
    required this.value,
    required this.suit,
  });

  factory PlayingCard.fromJson(Map<String, dynamic> json) {
    return PlayingCard(
      imageUrl: (json['image'] as String).replaceAll('.svg', '.png'),
      value: json['value'] as String,
      suit: json['suit'] as String,
    );
  }
}


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Карты';

    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
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
  late Future<List<PlayingCard>> _future;

  @override
  void initState() {
    super.initState();
    _future = loadCards();
  }

  void _reloadCards() {
    setState(() {
      _future = loadCards();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _reloadCards,
            child: const Text("Достать новые карты"),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: FutureBuilder<List<PlayingCard>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Ошибка: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  return PlayingCardList(cards: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class PlayingCardList extends StatelessWidget {
  const PlayingCardList({super.key, required this.cards});

  final List<PlayingCard> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return Image.network(cards[index].imageUrl);
      },
    );
  }
}