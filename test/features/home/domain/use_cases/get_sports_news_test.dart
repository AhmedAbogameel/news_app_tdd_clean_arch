import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/respository/respository.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/use_cases/get_sports_news.dart';

import 'get_sports_news_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetSportsNews getSportsNews;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getSportsNews = GetSportsNews(repository: mockHomeRepository);
  });

  test(
    'should return List<Article> from repository',
    () async {
      // arrange
      final tArticles = [
        Article(title: 'title1', content: 'content1', description: 'description1', author: 'author1', imageUrl: 'imageUrl1', publishAt: 'publishAt1'),
        Article(title: 'title2', content: 'content2', description: 'description2', author: 'author2', imageUrl: 'imageUrl2', publishAt: 'publishAt2'),
      ];
      when(mockHomeRepository.getSportsNews()).thenAnswer((_) async => Right(tArticles));
      // act
      final result = await getSportsNews();
      // assert
      verify(mockHomeRepository.getSportsNews());
      expect(result, Right(tArticles));
    },
  );

}