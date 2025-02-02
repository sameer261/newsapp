import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/services/api/containerapi/model.dart';

class NewsService {
  // Fetching data from the API
  Future<List<Article>> fetchArticles(int i) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=general&apiKey=0aca74fe48d4493598ada32dc71ea04f'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Parsing the JSON 'results' and returning the list of articles
      List<dynamic> articlesData = data['articles'];
      return articlesData
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
