import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app_tdd_clean_arch/core/errors/failures.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/use_cases/get_sports_news.dart';
import 'package:news_app_tdd_clean_arch/features/home/presentation/bloc/_home_bloc.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetSportsNews])
void main() {
  late MockGetSportsNews mockGetSportsNews;
  late HomeBloc bloc;

  final tArticles = [
    Article(title: 'title', content: 'content', description: 'description', author: 'author', imageUrl: 'imageUrl', publishAt: 'publishAt'),
  ];

  setUp(() {
    mockGetSportsNews = MockGetSportsNews();
    bloc = HomeBloc(getSportsNews: mockGetSportsNews);
  });

  test(
    'should first state be HomeInitialState',
    () async {
      // assert
      expect(bloc.state, HomeInitialState());
    },
  );

  test(
    'should emit loaded when data is valid',
    () async {
      // arrange
      when(mockGetSportsNews())
          .thenAnswer((_) async => Right(tArticles));
      // act
      bloc.add(HomeGetSportsNewsEvent());
      // assert
      final expected = [HomeLoadingState(), HomeLoadedState(tArticles)];
      expectLater(bloc.stream, emitsInOrder(expected));
    },
  );

  test(
    'should emit error when data is invalid',
    () async {
      // arrange
      when(mockGetSportsNews())
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      bloc.add(HomeGetSportsNewsEvent());
      // assert
      final expected = [HomeLoadingState(), HomeErrorState(SERVER_FAILURE_MESSAGE)];
      expectLater(bloc.stream, emitsInOrder(expected));
    },
  );

}