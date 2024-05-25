class fArticle {
  String title;
  String summary;
  String imageUrl;

  Article({this.title, this.summary, this.imageUrl});

  // Make the fromJson method static
  static Article fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      summary: json['summary'],
      imageUrl: json['imageUrl'],
    );
  }
}
