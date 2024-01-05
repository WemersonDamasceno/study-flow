// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:study_flow/core/database_helper/database_helper.dart' as _i4;
import 'package:study_flow/core/session/session.dart' as _i5;
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart'
    as _i3;
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart'
    as _i7;
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart'
    as _i6;
import 'package:study_flow/data/repositories/user_repository_impl.dart' as _i9;
import 'package:study_flow/domain/repositories/user/user_repository.dart'
    as _i8;
import 'package:study_flow/domain/usecases/token/get_token_in_local_storage_usecase.dart'
    as _i10;
import 'package:study_flow/domain/usecases/token/remove_token_in_local_storage_usecase.dart'
    as _i11;
import 'package:study_flow/domain/usecases/token/save_token_in_local_storage_usecase.dart'
    as _i12;
import 'package:study_flow/domain/usecases/user/save_user_usecase.dart' as _i13;
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart'
    as _i15;
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart'
    as _i16;
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart'
    as _i14;

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
    gh.factory<_i4.DatabaseHelper>(() => _i4.DatabaseHelper());
    gh.singleton<_i5.Session>(_i5.Session());
    gh.factory<_i6.SharedPrefImpl>(() => _i6.SharedPrefImpl());
    gh.factory<_i7.SqliteDataSource>(() =>
        _i7.SqliteDatasourceImpl(databaseHelper: gh<_i4.DatabaseHelper>()));
    gh.factory<_i6.SharedPrefDatasource>(() => _i6.SharedPrefDatasourceImpl(
        sharedPreferences: gh<_i6.SharedPrefImpl>()));
    gh.lazySingleton<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
          sqliteDataSource: gh<_i7.SqliteDataSource>(),
          sharedPreferencesDataSource: gh<_i6.SharedPrefDatasource>(),
        ));
    gh.lazySingleton<_i10.GetTokenInLocalStorageUsecase>(() =>
        _i10.GetTokenInLocalStorageUsecase(
            userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i11.RemoveTokenInLocalStorageUsecase>(() =>
        _i11.RemoveTokenInLocalStorageUsecase(
            userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i12.SaveTokenInLocalStorageUsecase>(() =>
        _i12.SaveTokenInLocalStorageUsecase(
            userRepository: gh<_i8.UserRepository>()));
    gh.lazySingleton<_i13.SaveUserUsecase>(
        () => _i13.SaveUserUsecase(userRepository: gh<_i8.UserRepository>()));
    gh.factory<_i14.GetTokenInLocalStorageBloc>(() =>
        _i14.GetTokenInLocalStorageBloc(
            getUserInLocalStorageUsecase:
                gh<_i10.GetTokenInLocalStorageUsecase>()));
    gh.factory<_i15.SaveTokenBloc>(() => _i15.SaveTokenBloc(
        saveTokenInLocalStorageUsecase:
            gh<_i12.SaveTokenInLocalStorageUsecase>()));
    gh.factory<_i16.SaveUserLocalStorageBloc>(() =>
        _i16.SaveUserLocalStorageBloc(
            saveUserUsecase: gh<_i13.SaveUserUsecase>()));
    return this;
  }
}
