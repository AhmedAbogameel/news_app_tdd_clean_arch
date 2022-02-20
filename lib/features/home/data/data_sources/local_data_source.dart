import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';

abstract class HomeLocalDataSource {
  Future<List<ArticleModel>> getSportsNews();
  Future<void> setSportsNews(List<ArticleModel> articles);
}

const String SPORTS_CACHING_KEY = 'sports';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final GetStorage getStorage;

  HomeLocalDataSourceImpl({required this.getStorage});

  @override
  Future<List<ArticleModel>> getSportsNews() async {
    if (getStorage.hasData(SPORTS_CACHING_KEY)) {
      final result = json.decode(await getStorage.read(SPORTS_CACHING_KEY));
      List<ArticleModel> articles = [];
      for (var i in result) {
        articles.add(ArticleModel.fromJson(i));
      }
      return articles;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setSportsNews(List<ArticleModel> articles) async {
    List<dynamic> encodedArticles = [];
    for (var i in articles) {
      encodedArticles.add(i.toJson());
    }
    await getStorage.write(SPORTS_CACHING_KEY, json.encode(encodedArticles));
  }
}
