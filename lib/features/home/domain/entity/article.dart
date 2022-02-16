import 'package:equatable/equatable.dart';

class Article extends Equatable {

  final String author;
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String publishAt;

  Article({
    required this.title,
    required this.content,
    required this.description,
    required this.author,
    required this.imageUrl,
    required this.publishAt,
  });

  @override
  List<Object?> get props => [
    author,
    imageUrl,
    description,
    imageUrl,
    content,
    publishAt,
  ];

}