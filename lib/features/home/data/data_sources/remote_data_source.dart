import 'package:dio/dio.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/model/article_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ArticleModel>> getSportsNews();
}

const BASE_URL = 'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=df1a070b89e64ce78ba286cea86af31b';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ArticleModel>> getSportsNews() async {
    final response = await dio.get(BASE_URL);
    if (response.statusCode == 200) {
      return _convertResponseToModel(response.data);
    } else {
      throw ServerException();
    }
  }

  List<ArticleModel> _convertResponseToModel(dynamic data) {
    List<ArticleModel> articles = [];
    for (var j in data['articles']) {
      articles.add(ArticleModel.fromJson(j));
    }
    return articles;
  }

}
