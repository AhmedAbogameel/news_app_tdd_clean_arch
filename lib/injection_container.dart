import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/local_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/data_sources/remote_data_source.dart';
import 'package:news_app_tdd_clean_arch/features/home/data/respository/repository_impl.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/respository/respository.dart';
import 'package:news_app_tdd_clean_arch/features/home/domain/use_cases/get_sports_news.dart';
import 'package:news_app_tdd_clean_arch/features/home/presentation/bloc/_home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => HomeBloc(
        getSportsNews: sl(),
      ));
  // Use Cases
  sl.registerLazySingleton(() => GetSportsNews(
        repository: sl(),
      ));
  // Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
  ));
  // DataSource
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(
        dio: sl(),
      ));
  sl.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl(
    getStorage: sl(),
  ));
  // Core

  // External
  sl.registerLazySingleton<Dio>(
    () => Dio()..options.validateStatus = (v) => true,
  );

  await GetStorage.init();
  sl.registerLazySingleton<GetStorage>(
          () => GetStorage()
  );
}
