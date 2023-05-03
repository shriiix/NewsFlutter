class ModelNewsArticle {
  String title;
  String publishedAt;
  String description;
  String url;
  String urlToImg;

  ModelNewsArticle(
      {required this.title,
      required this.publishedAt,
      required this.description,
      required this.url,
      required this.urlToImg});

  factory ModelNewsArticle.fromJson(Map<String, dynamic> json) {
    return ModelNewsArticle(
        title: json['title'] ?? "",
        publishedAt: json['publishedAt'] ?? "",
        description: json['description'] ?? "",
        url: json['url'] ?? "",
        urlToImg: json['urlToImage'] ?? "");
  }
}
