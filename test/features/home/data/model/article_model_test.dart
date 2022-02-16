import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  final tArticleModel = ArticleModel(
    title: 'title',
    content: 'content',
    description: 'description',
    author: 'author',
    imageUrl: 'imageUrl',
    publishAt: 'publishAt',
  );

  test(
    'should be subclass of Article',
    () async {
      // assert
      expect(tArticleModel, isA<Article>());
    },
  );

  group('fromJson', () {
    test(
      'should return valid model when response contains articles',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('success_news'));
        // act
        final result = ArticleModel.fromJson(jsonMap['articles'][0]);
        // assert
        expect(result, equals(tArticleModel));
      },
    );
  });

  group("toJson", () {
    test(
      'should return Map<String, dynamic> when calling toJson',
      () async {
        // arrange
        final result = tArticleModel.toJson();
        // act
        final expectedJson = {
          'title': 'title',
          'content': 'content',
          'description': 'description',
          'author': 'author',
          'urlToImage': 'imageUrl',
          'publishedAt': 'publishAt',
        };
        // assert
        expect(result, equals(expectedJson));
      },
    );
  });

}