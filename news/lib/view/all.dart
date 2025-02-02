import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/allpagecontroller.dart';
import 'package:news/view/allnews.dart';

class All extends StatelessWidget {
  const All({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleController articleController =
        Get.put(ArticleController()); // Get the controller

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Use Obx to reactively update UI when articles change
          Obx(() {
            if (articleController.articles.isEmpty) {
              return Center(
                child: Container(
                  width: 343,
                  height: 180,
                  decoration: ShapeDecoration(
                    color: Color.fromARGB(51, 250, 246, 246),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ), // Show loader while fetching data
                ),
              );
            }

            return Column(
              children: [
                // Carousel using PageView for automatic transition
                SizedBox(
                  height: 180,
                  width: 343,
                  child: PageView.builder(
                    controller: articleController.pageController,
                    itemCount: 3, // Show only 3 items (index 0, 1, 2)
                    onPageChanged: (index) {
                      articleController.currentIndex.value =
                          index; // Update index when user swipes
                    },
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: 343,
                        height: 180,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(51, 250, 246, 246),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Stack(
                          children: [
                            // Background image (fitting inside the container)
                            articleController.articles.isNotEmpty &&
                                    articleController
                                        .articles[index].imageUrl.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      articleController
                                          .articles[index].imageUrl,
                                      height: 180,
                                      width: 343,
                                      fit: BoxFit
                                          .cover, // Ensures the image fits inside the container
                                    ),
                                  )
                                : Container(), // If no image URL, don't show image

                            // Content inside the container
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Dots Row

                                  SizedBox(height: 90),
                                  // "DATE" Row
                                  Row(
                                    children: [
                                      Text(
                                        articleController
                                            .articles[index].pubDate,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Color(
                                              0xFFB8B8B8), // Change text color to gray
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),

                                  // "TITLE" Row with Arrow icon at the end
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Title with maxLines and overflow handling
                                      Expanded(
                                        child: Text(
                                          articleController
                                              .articles[index].title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.visible,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/Frame.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),

          SizedBox(height: 24),
          // Top Stories Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Stories',
                style: TextStyle(
                  color: Color(0xFFE8E8E8),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.10,
                  letterSpacing: -0.41,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1.20,
                  letterSpacing: -0.41,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(child: Allnews()),
        ],
      ),
    );
  }
}
