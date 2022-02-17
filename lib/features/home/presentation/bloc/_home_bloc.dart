import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/use_cases/get_sports_news.dart';

part '_home_event.dart';
part '_home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {

  final GetSportsNews getSportsNews;

  HomeBloc({required this.getSportsNews}) : super(HomeInitialState()) {
    on<HomeEvents>((event, emit) async {
      emit(HomeLoadingState());
      final failureOrArticles = await getSportsNews();
      failureOrArticles.fold(
            (failure) => emit(HomeErrorState(SERVER_FAILURE_MESSAGE)),
            (articles) => emit(HomeLoadedState(articles)),
      );
    });
  }
}

const String SERVER_FAILURE_MESSAGE = 'Error Has Occurred, Try Again!';