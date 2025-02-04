import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/services/api/containerapi/apiservice.dart';
import 'package:news/services/api/containerapi/model.dart';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;
  var currentIndex = 0.obs; // To track the current page index
  final PageController pageController = PageController(initialPage: 0);
  Timer? _autoScrollTimer;

  @override
  void onInit() {
    super.onInit();
    fetchArticlesForIndex(
        currentIndex.value); // Fetch articles based on initial index
    _startAutoScroll();
  }

  @override
  void onClose() {
    _autoScrollTimer?.cancel(); // Cancel timer when controller is disposed
    super.onClose();
  }

  // Fetch articles based on index
  Future<void> fetchArticlesForIndex(int index) async {
    try {
      List<Article> fetchedArticles;
      if (index == 0) {
        fetchedArticles =
            await NewsService().fetchArticles(9); // Fetch starting from index 0
      } else if (index == 5) {
        fetchedArticles =
            await NewsService().fetchArticles(5); // Fetch starting from index 5
      } else {
        fetchedArticles =
            await NewsService().fetchArticles(7); // Fetch starting from index 7
      }
      articles.value = fetchedArticles;
    } catch (e) {
      print("Error fetching articles: $e");
    }
  }

  // Start auto scroll every 3 seconds
  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (articles.isNotEmpty) {
        int nextIndex =
            (currentIndex.value + 1) % 3; // Ensure it cycles 0, 1, 2
        currentIndex.value = nextIndex;
        pageController.animateToPage(nextIndex,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }
}
