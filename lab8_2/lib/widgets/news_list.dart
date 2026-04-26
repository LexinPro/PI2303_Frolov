import 'package:flutter/material.dart';
import 'package:lab8_2/api/get_news.dart';
import 'package:lab8_2/widgets/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchNews(),
      builder:(context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Ошибка запроса!"),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return NewsCard(
                news: snapshot.data![index]
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}