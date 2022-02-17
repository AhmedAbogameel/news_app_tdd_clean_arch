part of '_home_bloc.dart';

abstract class HomeStates extends Equatable {
  const HomeStates();
}

class HomeInitialState extends HomeStates {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeStates {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeStates {
  final List<Article> articles;

  HomeLoadedState(this.articles);
  @override
  List<Object> get props => [articles];
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState(this.message);
  @override
  List<Object> get props => [message];
}