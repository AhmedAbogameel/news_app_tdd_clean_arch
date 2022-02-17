import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tdd_clean_arch/features/home/presentation/bloc/_home_bloc.dart';
import 'package:news_app_tdd_clean_arch/injection_container.dart' as di;
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HomeBloc>()..add(HomeGetSportsNewsEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<HomeBloc, HomeStates>(
            builder: (context, state) {
              if (state is HomeErrorState) {
                return Text(state.message);
              } else if (state is HomeLoadingState) {
                return LinearProgressIndicator();
              } else if (state is HomeLoadedState) {
                final articles = state.articles;
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.network(articles[index].imageUrl),
                      Text(articles[index].title),
                    ],
                  ),
                );
              } else {
                return Text('Unexpected State');
              }
            },
          ),
        ),
      ),
    );
  }

}
