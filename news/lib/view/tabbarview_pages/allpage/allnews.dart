import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/allnewscontroller.dart';
import 'package:news/view/newspage_fullview/newspage.dart'; // Import the NewsController

class Allnews extends StatelessWidget {
  const Allnews({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final NewsController newsController = Get.put(NewsController());

    // Fetch the articles when the widget is first built
    newsController.fetchArticles();

    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (newsController.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.grey,
        ));
      }

      return ListView.builder(
        itemCount: newsController.newsList.length,
        itemBuilder: (context, index) {
          final article = newsController.newsList[index];

          return Padding(
            padding: const EdgeInsets.only(
                bottom: 12), // Add space after each container
            child: GestureDetector(
              onTap: () {
                Get.to(Newspage(), arguments: article);
              },
              child: Container(
                width: 343,
                height: 108,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 62,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(article.imageUrl),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    // Conditionally show shortened source name based on screen width
                                    screenWidth < 400
                                        ? newsController.getLimitedSourceName(
                                            article.sourceName)
                                        : article.sourceName,
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '•',
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    overflow: TextOverflow.visible,
                                    article.language,
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              // Limit text to two lines only
                              Text(
                                article.title,
                                maxLines: 2, // Limit to 2 lines
                                overflow:
                                    TextOverflow.visible, // Handle overflow
                                style: TextStyle(
                                  color: Color(0xFFE8E8E8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          article.pubDate,
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              size: 18,
                              color: Color(0xFF888888),
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.more_vert,
                              size: 18,
                              color: Color(0xFF888888),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

// String _getLimitedSourceName(String sourceName) {
//   List<String> words = sourceName.split(" "); // Split the source name by space
//   if (words.length > 2) {
//     return words.take(2).join(" ") + "..."; // Join first 3 words with "..."
//   }
//   return sourceName; // If less than 3 words, return the full source name
// }
