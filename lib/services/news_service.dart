import 'dart:convert';

import 'package:tested/models/new.dart';
import 'package:http/http.dart' as http;

class NewService {
  static const String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=id&apiKey=3f9b51da697f4c519fbe59dae983de38';
  static Future<List<New>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl'));
      final body = response.body;
      final result = jsonDecode(body);
      List<New> News = List<New>.from(
        result['articles'].map(
          (New) => New.fromJson(New),
        ),
      );
      return News;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
