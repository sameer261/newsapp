class Article {
  final String title;
  final String imageUrl;
  final String pubDate;

  Article({
    required this.title,
    required this.imageUrl,
    required this.pubDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title', // Provide default if null
      imageUrl: json['urlToImage'] ??
          'https://answers-afd.microsoft.com/static/images/image-not-found.jpg', // Provide empty string if null
      pubDate: json['publishedAt'] ?? 'No Date', // Provide default if null
    );
  }
}
