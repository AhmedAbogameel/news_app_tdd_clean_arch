import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/core/errors/failures.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/local_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/respository/repository_impl.dart';

import 'repository_impl_test.mocks.dart';


@GenerateMocks([HomeRemoteDataSource, HomeLocalDataSource])
void main() {

  late MockHomeRemoteDataSource mockHomeRemoteDataSource;
  late MockHomeLocalDataSource mockHomeLocalDataSource;
  late HomeRepositoryImpl homeRepositoryImpl;

  setUp(() {
    mockHomeLocalDataSource = MockHomeLocalDataSource();
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    homeRepositoryImpl = HomeRepositoryImpl(
      remoteDataSource: mockHomeRemoteDataSource,
      localDataSource: mockHomeLocalDataSource,
    );
  });

  final List<ArticleModel> tArticles = [
    ArticleModel(title: 'title', content: 'content', description: 'description', author: 'author', imageUrl: 'imageUrl', publishAt: 'publishAt'),
  ];

  group('device is online', () {
    test(
      'should call getSportsNews from HomeRepositoryImpl',
          () async {
        // arrange
        when(mockHomeRemoteDataSource.getSportsNews()).thenAnswer((_) async => []);
        // act
        homeRepositoryImpl.getSportsNews();
        // assert
        verify(mockHomeRemoteDataSource.getSportsNews());
      },
    );

    test(
      'should return valid List<ArticleModel>',
          () async {
        // arrange
        when(mockHomeRemoteDataSource.getSportsNews()).thenAnswer((_) async => tArticles);
        // act
        final result = await homeRepositoryImpl.getSportsNews();
        // assert
        expect(result, equals(Right(tArticles)));
      },
    );

    test(
      'should call localDataSource to cache after getting success data',
      () async {
        // arrange
        when(mockHomeRemoteDataSource.getSportsNews()).thenAnswer((_) async => tArticles);
        // act
        await homeRepositoryImpl.getSportsNews();
        // assert
        verify(mockHomeLocalDataSource.setSportsNews(any));
      },
    );

    test(
      'should return ServerFailure when data is invalid',
          () async {
        // arrange
        when(mockHomeRemoteDataSource.getSportsNews()).thenThrow(ServerException());
        // act
        final result = await homeRepositoryImpl.getSportsNews();
        // assert
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  group('Device is offline', () {
    test(
      'should get List of ArticleModel from cache when remoteDataSource throwing an exception',
      () async {
        // arrange
        when(mockHomeRemoteDataSource.getSportsNews()).thenThrow(ServerException());
        when(mockHomeLocalDataSource.getSportsNews()).thenAnswer((_) async => tArticles);
        // act
        final result = await homeRepositoryImpl.getSportsNews();
        // assert
        expect(result, Right(tArticles));
        verify(mockHomeLocalDataSource.getSportsNews());
      },
    );

    test(
      'should throw CacheException when Server Failure and there is no data in cache',
          () async {
        // arrange
        when(mockHomeRemoteDataSource.getSportsNews()).thenThrow(ServerException());
        when(mockHomeLocalDataSource.getSportsNews()).thenThrow(CacheException());
        // act
        final result = await homeRepositoryImpl.getSportsNews();
        // assert
        expect(result, Left(CacheFailure()));
      },
    );
  });

}