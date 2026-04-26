import 'package:flutter/material.dart';
import 'package:lab8_2/models/News.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.imageUrl),
        
            Text(
              news.date,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
        
            Text(
              news.title,
              style: TextStyle(
                fontWeight: FontWeight(700)
              )
            ),
        
            SizedBox(
              height: (!news.text.isEmpty) ? 15 : 0,
            ),
        
            Text(news.text),
          ],
        ),
      )
    );
  }
}