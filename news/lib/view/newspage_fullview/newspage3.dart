import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news/services/api/busniess/model.dart';
import 'package:news/utils/colors.dart'; // Assuming Article model is in 'models/article.dart'

class Newspage3 extends StatelessWidget {
  const Newspage3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the article passed from the previous page
    final Article article = Get.arguments; // Get the article data

    return Scaffold(
      backgroundColor: theme,
      appBar: AppBar(
        backgroundColor: theme,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border_outlined),
            onPressed: () {
              // Your bookmark action here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Your more actions here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display article's image in a container
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      article.urlToImage), // Use imageUrl from model
                  fit: BoxFit.cover, // Adjust image fitting
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Display categories if available
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    article
                        .category, // Display categories as a comma-separated string
                    style: TextStyle(
                      color: Color(0xFFBDA6F5), // Color for the category text
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Display the title of the article
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                article.title, // Display the title of the article
                style: TextStyle(
                  color: Colors.white, // White color for the title
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Row to display source name, language, and pubDate
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Source name with truncation
                      Expanded(
                        child: Text(
                          article.sourceName, // Display source name
                          overflow: TextOverflow
                              .ellipsis, // Truncate long source name
                          maxLines: 1, // Limit to one line
                          style: TextStyle(
                            color: Color(0xFFB8B8B8), // Light gray color
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 8), // Spacing between source and language
                      Text(
                        '—', // Bullet symbol between source and language
                        style: TextStyle(
                          color: Color(0xFFB8B8B8), // Light gray color
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 8), // Spacing after bullet
                      Text(
                        article.language, // Display language
                        style: TextStyle(
                          color: Color(0xFFB8B8B8), // Light gray color
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Display pubDate
                  Text(
                    article.publishedAt, // Display publication date
                    style: TextStyle(
                      color: Color(0xFFB8B8B8), // Light gray color
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Social media icons below pubDate and description
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.facebookF, // Facebook icon
                      color: Color(0xFFB8B8B8), // Facebook blue color
                      size: 20, // Set the icon size to 20
                    ),
                    onPressed: () {
                      // Handle Facebook action here
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter, // Twitter icon
                      color: Color(0xFFB8B8B8), // Twitter blue color
                      size: 20, // Set the icon size to 20
                    ),
                    onPressed: () {
                      // Handle Twitter action here
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.link, // Link icon
                      color: Color(0xFFB8B8B8), // Default gray color
                      size: 20, // Set the icon size to 20
                    ),
                    onPressed: () {
                      // Handle Link action here
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Add space below the pubDate
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                article.description, // Display description
                style: TextStyle(
                  color: Color(0xFFB8B8B8), // Gray color for the description
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
