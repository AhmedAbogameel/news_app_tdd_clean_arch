import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;

  final tArticles = [
    ArticleModel(
      title: 'title',
      content: 'content',
      description: 'description',
      author: 'author',
      imageUrl: 'imageUrl',
      publishAt: 'publishAt',
    )
  ];

  final Map<String, dynamic> successJson = json.decode(fixture('success_news'));

  setUp(() {
    mockDio = MockDio();
    homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl(dio: mockDio);
  });

  final tSuccessResponse = Response(
    requestOptions: RequestOptions(path: 'path'),
    data: successJson,
    statusCode: 200,
  );

  final tFailureResponse = Response(
    requestOptions: RequestOptions(path: 'path'),
    statusCode: 403,
  );

  test(
    'should get List<ArticleModel> when call is 200',
    () async {
      // arrange
      when(mockDio.get(any)).thenAnswer(
        (_) async => tSuccessResponse,
      );
      // act
      final result = await homeRemoteDataSourceImpl.getSportsNews();
      // assert
      expect(result, equals(tArticles));
    },
  );

  test(
    'should throws ServerFailure when call is not 200',
        () async {
      // arrange
      when(mockDio.get(any)).thenAnswer((_) async => tFailureResponse);
      // act
      final result = homeRemoteDataSourceImpl.getSportsNews;
      // assert
      expect(() => result(), throwsA(TypeMatcher<ServerException>()));
    },
  );
}
