import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';

abstract class HomeRemoteDataSource {

  Future<List<ArticleModel>> getSportsNews();

}