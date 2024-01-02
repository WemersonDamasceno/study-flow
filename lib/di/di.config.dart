// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart'
    as _i3;
import 'package:study_flow/data/repositories/user_repository_impl.dart' as _i5;
import 'package:study_flow/domain/repositories/user/user_repository.dart'
    as _i4;
import 'package:study_flow/domain/usecases/get_user_in_local_storage_usecase.dart'
    as _i6;
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.SharedPreferencesImpl>(() => _i3.SharedPreferencesImpl());
    gh.factory<_i3.SharedPrefDatasource>(() => _i3.SharedPrefDatasourceImpl(
        sharedPreferencesImpl: gh<_i3.SharedPreferencesImpl>()));
    gh.lazySingleton<_i4.UserRepository>(() => _i5.UserRepositoryImpl(
        userLocalDataSource: gh<_i3.SharedPrefDatasource>()));
    gh.lazySingleton<_i6.GetUserInLocalStorageUsecase>(() =>
        _i6.GetUserInLocalStorageUsecase(
            userRepository: gh<_i4.UserRepository>()));
    gh.factory<_i7.GetUserInLocalStorageBloc>(() =>
        _i7.GetUserInLocalStorageBloc(
            getUserInLocalStorageUsecase:
                gh<_i6.GetUserInLocalStorageUsecase>()));
    return this;
  }
}
