import 'package:get/get.dart';
import 'package:news/services/api/allpage_newsapi/apiservice_allnews.dart';
import 'package:news/services/api/allpage_newsapi/newsmodel.dart'; // Import the service for fetching data

class NewsController extends GetxController {
  var newsList = <NewsArticle>[].obs;
  var isLoading = true.obs;

  // Fetch articles and update the newsList
  Future<void> fetchArticles() async {
    try {
      isLoading(true); // Show loading while fetching
      var articles = await AllNewsService().fetchArticles();
      newsList.assignAll(articles); // Update the list
    } catch (e) {
      print("Error fetching news articles: $e");
    } finally {
      isLoading(false); // Hide loading
    }
  }

  String getLimitedSourceName(String sourceName) {
    List<String> words =
        sourceName.split(" "); // Split the source name by space
    if (words.length > 2) {
      return words.take(2).join(" ") + "..."; // Join first 3 words with "..."
    }
    return sourceName; // If less than 3 words, return the full source name
  }
}
