import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/services/api/allpage_newsapi/newsmodel.dart'; // Import the NewsArticle model file

class AllNewsService {
  // Fetching data from the API
  Future<List<NewsArticle>> fetchArticles() async {
    final response = await http.get(Uri.parse(
        'https://newsdata.io/api/1/latest?country=pk&apikey=pub_5487244216ef152ff88d703e69e3fcbc35732'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Parsing the JSON 'results' and returning the list of NewsArticles
      List<dynamic> articlesData = data['results'];
      return articlesData
          .map((articleJson) => NewsArticle.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
