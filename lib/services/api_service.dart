import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article.dart';

class ApiService {
  static const String baseUrl =
      'https://api.spaceflightnewsapi.net/v3/articles?_start=';

  Future<List> fetchArticles(int start) async {
    final response = await http.get(Uri.parse('$baseUrl$start&_limit=20'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
