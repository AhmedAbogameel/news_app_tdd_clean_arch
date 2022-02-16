import 'package:dartz/dartz.dart';
import 'package:news_app_tdd_clean_arch/core/errors/failures.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';

abstract class HomeRepository {

  Future<Either<Failure, List<Article>>> getSportsNews();

}