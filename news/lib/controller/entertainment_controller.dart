import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/services/api/entertainment/model.dart';

class EntertainmentController extends GetxController {
  RxBool isLoading = true.obs;
  var newsList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  // Fetch the data from your API
  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=0aca74fe48d4493598ada32dc71ea04f'));

      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        var articlesList = (decodedJson['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        newsList.value = articlesList;
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      print("Error fetching news: $e");
    } finally {
      isLoading.value =
          false; // Set loading to false once the request completes
    }
  }

  String getLimitedSourceName(String sourceName) {
    List<String> words =
        sourceName.split(" "); // Split the source name by space
    if (words.length > 2) {
      return "${words.take(2).join(" ")}..."; // Join first 3 words with "..."
    }
    return sourceName; // If less than 3 words, return the full source name
  }
}
