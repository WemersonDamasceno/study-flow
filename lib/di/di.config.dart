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
import 'package:study_flow/core/session/session.dart' as _i7;
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart'
    as _i3;
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart'
    as _i9;
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart'
    as _i8;
import 'package:study_flow/data/repositories/user_repository_impl.dart' as _i11;
import 'package:study_flow/domain/repositories/user/user_repository.dart'
    as _i10;
import 'package:study_flow/domain/usecases/token/get_token_in_local_storage_usecase.dart'
    as _i12;
import 'package:study_flow/domain/usecases/token/remove_token_in_local_storage_usecase.dart'
    as _i13;
import 'package:study_flow/domain/usecases/token/save_token_in_local_storage_usecase.dart'
    as _i14;
import 'package:study_flow/domain/usecases/user/save_user_usecase.dart' as _i15;
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart'
    as _i17;
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart'
    as _i18;
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart'
    as _i6;
import 'package:study_flow/presentation/home/controller/quantity_controller.dart'
    as _i5;
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart'
    as _i16;

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
    gh.factory<_i5.QuantityController>(() => _i5.QuantityController());
    gh.factory<_i6.SelectTagPriorityBloc>(() => _i6.SelectTagPriorityBloc());
    gh.singleton<_i7.Session>(_i7.Session());
    gh.factory<_i8.SharedPrefImpl>(() => _i8.SharedPrefImpl());
    gh.factory<_i9.SqliteDataSource>(() =>
        _i9.SqliteDatasourceImpl(databaseHelper: gh<_i4.DatabaseHelper>()));
    gh.factory<_i8.SharedPrefDatasource>(() => _i8.SharedPrefDatasourceImpl(
        sharedPreferences: gh<_i8.SharedPrefImpl>()));
    gh.lazySingleton<_i10.UserRepository>(() => _i11.UserRepositoryImpl(
          sqliteDataSource: gh<_i9.SqliteDataSource>(),
          sharedPreferencesDataSource: gh<_i8.SharedPrefDatasource>(),
        ));
    gh.lazySingleton<_i12.GetTokenInLocalStorageUsecase>(() =>
        _i12.GetTokenInLocalStorageUsecase(
            userRepository: gh<_i10.UserRepository>()));
    gh.lazySingleton<_i13.RemoveTokenInLocalStorageUsecase>(() =>
        _i13.RemoveTokenInLocalStorageUsecase(
            userRepository: gh<_i10.UserRepository>()));
    gh.lazySingleton<_i14.SaveTokenInLocalStorageUsecase>(() =>
        _i14.SaveTokenInLocalStorageUsecase(
            userRepository: gh<_i10.UserRepository>()));
    gh.lazySingleton<_i15.SaveUserUsecase>(
        () => _i15.SaveUserUsecase(userRepository: gh<_i10.UserRepository>()));
    gh.factory<_i16.GetTokenInLocalStorageBloc>(() =>
        _i16.GetTokenInLocalStorageBloc(
            getUserInLocalStorageUsecase:
                gh<_i12.GetTokenInLocalStorageUsecase>()));
    gh.factory<_i17.SaveTokenBloc>(() => _i17.SaveTokenBloc(
        saveTokenInLocalStorageUsecase:
            gh<_i14.SaveTokenInLocalStorageUsecase>()));
    gh.factory<_i18.SaveUserLocalStorageBloc>(() =>
        _i18.SaveUserLocalStorageBloc(
            saveUserUsecase: gh<_i15.SaveUserUsecase>()));
    return this;
  }
}
