import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/local_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'local_data_source_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<GetStorage>(unsupportedMembers: {#getKeys, #getValues})
])
void main() {

  late MockGetStorage mockGetStorage;
  late HomeLocalDataSourceImpl homeLocalDataSourceImpl;

  final cachedArticles = fixture('cached_news');

  final tArticles = [
    ArticleModel(
      title: 'title',
      content: 'content',
      description: 'description',
      author: 'author',
      imageUrl: 'imageUrl',
      publishAt: 'publishAt',
    ),
  ];

  setUp(() {
    mockGetStorage = MockGetStorage();
    homeLocalDataSourceImpl = HomeLocalDataSourceImpl(getStorage: mockGetStorage);
  });

  test(
    'should return List of Articles when there is in cache',
    () async {
      // arrange
      when(mockGetStorage.hasData(any)).thenAnswer((_) => true);
      when(mockGetStorage.read(any)).thenAnswer((_) async => cachedArticles);
      // act
      final result = await homeLocalDataSourceImpl.getSportsNews();
      // assert
      expect(result, equals(tArticles));
    },
  );

  test(
    'should throw a CacheException when there is no data in cache',
    () async {
      // arrange
      when(mockGetStorage.hasData(any)).thenAnswer((_) => false);
      // act
      final call = homeLocalDataSourceImpl.getSportsNews;
      // assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    },
  );

  test(
    'should cache articles',
    () async {
      // arrange
      when(mockGetStorage.write(any, any)).thenAnswer((_) async => null);
      // act
      await homeLocalDataSourceImpl.setSportsNews(tArticles);
      // assert
      verify(mockGetStorage.write(SPORTS_CACHING_KEY, any));
    },
  );

}
