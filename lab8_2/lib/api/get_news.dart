import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:lab8_2/models/News.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}


Future<List<News>> fetchNews() async {
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse("https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90"));
  client.close();
  final json = jsonDecode(response.body);
  return json.map<News>((jsonOne) => News.fromJson(jsonOne)).toList();
}
