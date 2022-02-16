import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    required String title,
    required String content,
    required String description,
    required String author,
    required String imageUrl,
    required String publishAt,
  }) : super(
          title: title,
          content: content,
          author: author,
          description: description,
          publishAt: publishAt,
          imageUrl: imageUrl,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        title: json['title'],
        content: json['content'],
        description: json['description'],
        author: json['author'],
        imageUrl: json['urlToImage'],
        publishAt: json['publishedAt'],
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'description': description,
    'author': author,
    'urlToImage': imageUrl,
    'publishedAt': publishAt,
  };
}
