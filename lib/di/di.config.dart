// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;
import 'package:sqflite/sqflite.dart' as _i7;
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart'
    as _i3;
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart'
    as _i6;
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart'
    as _i4;
import 'package:study_flow/data/repositories/user_repository_impl.dart' as _i9;
import 'package:study_flow/domain/repositories/user/user_repository.dart'
    as _i8;
import 'package:study_flow/domain/usecases/get_token_in_local_storage_usecase.dart'
    as _i10;
import 'package:study_flow/domain/usecases/remove_token_in_local_storage_usecase.dart'
    as _i11;
import 'package:study_flow/domain/usecases/save_token_in_local_storage_usecase.dart'
    as _i12;
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart'
    as _i14;
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart'
    as _i13;

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
    gh.factory<_i3.ButtonManagerStatusBloc>(
        () => _i3.ButtonManagerStatusBloc());
    gh.factory<_i4.SharedPrefDatasource>(() => _i4.SharedPrefDatasourceImpl(
        sharedPreferences: gh<_i5.SharedPreferences>()));
    gh.factory<_i6.SqliteDataSource>(
        () => _i6.SqliteDatasourceImpl(database: gh<_i7.Database>()));
    gh.lazySingleton<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
        userLocalDataSource: gh<_i4.SharedPrefDatasource>()));
    gh.lazySingleton<_i10.GetTokenInLocalStorageUsecase>(() =>
        _i10.GetTokenInLocalStorageUsecase(
            userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i11.RemoveTokenInLocalStorageUsecase>(() =>
        _i11.RemoveTokenInLocalStorageUsecase(
            userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i12.SaveTokenInLocalStorageUsecase>(() =>
        _i12.SaveTokenInLocalStorageUsecase(
            userRepository: gh<_i8.UserRepository>()));
    gh.factory<_i13.GetTokenInLocalStorageBloc>(() =>
        _i13.GetTokenInLocalStorageBloc(
            getUserInLocalStorageUsecase:
                gh<_i10.GetTokenInLocalStorageUsecase>()));
    gh.factory<_i14.SaveTokenBloc>(() => _i14.SaveTokenBloc(
        saveTokenInLocalStorageUsecase:
            gh<_i12.SaveTokenInLocalStorageUsecase>()));
    return this;
  }
}
