import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/entertainment_controller.dart';
import 'package:news/view/newspage2.dart';

class Entertainment extends StatelessWidget {
  const Entertainment({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    EntertainmentController newsController = Get.put(EntertainmentController());

    return Obx(() {
      if (newsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        );
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
                Get.to(Newspage2(), arguments: article);
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
                              image: NetworkImage(article.urlToImage),
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
                                    article.sourceName,
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
                              Text(
                                article.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                          article.publishedAt,
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
