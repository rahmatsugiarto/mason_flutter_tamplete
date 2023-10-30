// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../data/datasources/local/local_datasource.dart' as _i6;
import '../../data/datasources/remote/remote_datasource.dart' as _i4;
import '../../data/repositories/repository_impl.dart' as _i8;
import '../../domain/repositories/repository.dart' as _i7;
import '../../domain/usecases/clear_user_data_usecase.dart' as _i10;
import '../../domain/usecases/fetch_random_usecase.dart' as _i11;
import '../../domain/usecases/get_token_usecase.dart' as _i12;
import '../../domain/usecases/save_token_usecase.dart' as _i9;
import '../../presentation/blocs/home_bloc/home_cubit.dart' as _i13;
import 'register_module.dart' as _i14;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.Dio>(
    () => registerModule.dio,
    preResolve: true,
  );
  gh.lazySingleton<_i4.RemoteDataSource>(
      () => _i4.RemoteDataSourceImpl(dio: gh<_i3.Dio>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i6.LocalDataSource>(() =>
      _i6.LocalDataSourceImpl(sharedPreferences: gh<_i5.SharedPreferences>()));
  gh.lazySingleton<_i7.Repository>(() => _i8.RepositoryImpl(
        remoteDataSource: gh<_i4.RemoteDataSource>(),
        localDataSource: gh<_i6.LocalDataSource>(),
      ));
  gh.lazySingleton<_i9.SaveTokenUseCase>(
      () => _i9.SaveTokenUseCase(gh<_i7.Repository>()));
  gh.lazySingleton<_i10.ClearUserDataUseCase>(
      () => _i10.ClearUserDataUseCase(gh<_i7.Repository>()));
  gh.lazySingleton<_i11.FetchRandomUseCase>(
      () => _i11.FetchRandomUseCase(gh<_i7.Repository>()));
  gh.lazySingleton<_i12.GetTokenUseCase>(
      () => _i12.GetTokenUseCase(gh<_i7.Repository>()));
  gh.lazySingleton<_i13.HomeCubit>(() => _i13.HomeCubit(
        fetchRandomUseCase: gh<_i11.FetchRandomUseCase>(),
        saveTokenUseCase: gh<_i9.SaveTokenUseCase>(),
        getTokenUseCase: gh<_i12.GetTokenUseCase>(),
        clearUserDataUseCase: gh<_i10.ClearUserDataUseCase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i14.RegisterModule {}
