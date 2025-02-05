class NewsArticle {
  final String title;
  final String imageUrl;
  final String pubDate;
  final String sourceName;
  final String language; // Language attribute
  final List<String>? category; // Optional category field
  final String? description; // Optional description field

  NewsArticle({
    required this.title,
    required this.imageUrl,
    required this.pubDate,
    required this.sourceName,
    required this.language,
    this.category, // Optional parameter
    this.description, // Optional parameter
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title', // Provide default if null
      imageUrl: json['image_url'] ??
          'https://answers-afd.microsoft.com/static/images/image-not-found.jpg', // Provide empty string if null
      pubDate: json['pubDate'] ?? 'No Date', // Provide default if null
      sourceName:
          json['source_name'] ?? 'World News', // Provide default if null
      language:
          json['language'] ?? 'english', // Default to 'en' (English) if null
      category: json['category'] != null
          ? List<String>.from(json['category']) // Convert to List<String>
          : null, // If category doesn't exist, it's null
      description: json['description'], // Handle description (optional)
    );
  }
}
