class ArticleModel {
  String? title;
  String? author;
  String? description;
  String? urlToImage;
  String? content;
  String? articleUrl;
  String? publishedAt;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.urlToImage,
      required this.articleUrl,
      required this.publishedAt});
}

class NewsPageModel {
  String dateTime = "February 2021";
  String dateTimes = "January 2021";
  String dateHuff = "January 2021";
  String huffpath = "assets/1.png";
  String timespath = "assets/2.png";
  String timepath = "assets/3.png";
}
