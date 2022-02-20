import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';

abstract class CacheManager {
  Future<void> setNews(List<ArticleModel> articles);
  Future<List<ArticleModel>> getCachedSportsNews();
}
