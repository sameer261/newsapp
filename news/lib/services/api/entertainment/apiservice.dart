import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/services/api/entertainment/model.dart';

class ApiserviceClass {
  // Import the NewsArticle model file

  // Fetching data from the API
  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=0aca74fe48d4493598ada32dc71ea04f'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Parsing the JSON 'results' and returning the list of NewsArticles
      List<dynamic> articlesData = data['article'];
      return articlesData
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
