import 'package:intl/intl.dart';


class News {
  final String imageUrl;
  final String date;
  final String title;
  final String text;

  const News({
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.text
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      imageUrl: json['PREVIEW_PICTURE_SRC'],
      date: json['ACTIVE_FROM'],
      title: json['TITLE'],
      text: Bidi.stripHtmlIfNeeded(json['PREVIEW_TEXT']).trim(),
    );
  }
}