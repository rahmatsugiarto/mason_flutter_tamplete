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

import '../../data/repositories/local_repository.dart' as _i6;
import '../../data/repositories/remote_repository.dart' as _i4;
import '../../presentation/blocs/home_bloc/home_cubit.dart' as _i7;
import 'register_module.dart' as _i8;

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
  gh.lazySingleton<_i4.RemoteRepositoryImpl>(
      () => _i4.RemoteRepositoryImpl(dio: gh<_i3.Dio>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i6.LocalRepositoryImpl>(() =>
      _i6.LocalRepositoryImpl(sharedPreferences: gh<_i5.SharedPreferences>()));
  gh.lazySingleton<_i7.HomeCubit>(() => _i7.HomeCubit(
        remote: gh<_i4.RemoteRepositoryImpl>(),
        local: gh<_i6.LocalRepositoryImpl>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}
