class Article {
  String title;
  String description;
  String category;
  String publishedAt;
  String urlToImage;
  String sourceName;
  String language;

  Article({
    required this.title,
    required this.description,
    required this.category,
    required this.publishedAt,
    required this.urlToImage,
    required this.sourceName,
    required this.language, // Add language in the constructor
  });

  // Update the fromJson method to include the 'language' field
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: "Entertainment", // Hardcoded value
      publishedAt: json['publishedAt'] ?? '',
      urlToImage: json['urlToImage'] ??
          'https://answers-afd.microsoft.com/static/images/image-not-found.jpg',
      sourceName: json['source']['name'] ??
          '', // Mapping source name from the source map
      language: json['language'] ??
          'english', // Add the language from the JSON response
    );
  }
}
