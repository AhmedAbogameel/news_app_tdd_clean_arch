import 'package:dartz/dartz.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/core/errors/failures.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/local_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/respository/respository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<Article>>> getSportsNews() async {
    try {
      final result = await remoteDataSource.getSportsNews();
      localDataSource.setSportsNews(result);
      return Right(result);
    } on ServerException {
      return _getArticlesFromLocalDataSource();
    }
  }

  Future<Either<Failure, List<Article>>> _getArticlesFromLocalDataSource() async {
    try {
      final result = await localDataSource.getSportsNews();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

}