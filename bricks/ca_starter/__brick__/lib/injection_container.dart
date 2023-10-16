import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_handler.dart';
import 'data/datasources/remote/remote_datasource.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'domain/usecases/get_random_usecase.dart';
import 'presentation/bloc/home_bloc/home_cubit.dart';

// sl = Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  // //! Provider
  sl.registerFactory(() => HomeCubit(getRandomUseCase: sl()));

  // //! UseCase
  sl.registerLazySingleton(() => GetRandomUseCase(sl()));

  // //! Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
        remoteDataSource: sl(),
      ));

  // //! Data Source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dio: sl()));

  // //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
  sl.registerLazySingleton<DioHandler>(() => DioHandler(apiBaseUrl: ''));
}

