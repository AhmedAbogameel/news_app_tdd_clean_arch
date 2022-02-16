import 'package:dartz/dartz.dart';
import 'package:news_app_tdd_clean_arch/core/errors/failures.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/entity/article.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/respository/respository.dart';

class GetSportsNews {

  final HomeRepository repository;

  GetSportsNews({required this.repository});

  Future<Either<Failure, List<Article>>> call() => repository.getSportsNews();

}