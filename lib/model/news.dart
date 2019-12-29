class News {
  final int id;
  final String articleBody;
  final String headline;
  final String imageUrl;
  final String postedDate;
  final String sourceUrl;

  News({
    this.id,
    this.articleBody,
    this.headline,
    this.imageUrl,
    this.postedDate,
    this.sourceUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      articleBody: json['article_body'] as String,
      headline: json['headline'] as String,
      imageUrl: json['image_url'] as String,
      postedDate: json['posted_date'] as String,
      sourceUrl: json['source_url'] as String,
    );
  }
}
