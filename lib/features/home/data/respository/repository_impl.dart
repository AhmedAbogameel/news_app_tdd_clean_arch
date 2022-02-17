import 'package:dartz/dartz.dart';
import 'package:news_app_tdd_clean_arch/core/errors/exceptions.dart';
import 'package:news_app_tdd_clean_arch/core/errors/failures.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/respository/respository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Article>>> getSportsNews() async {
    try {
      final result = await remoteDataSource.getSportsNews();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}