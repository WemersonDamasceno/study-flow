// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart'
    as _i3;
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart'
    as _i4;
import 'package:study_flow/data/repositories/user_repository_impl.dart' as _i6;
import 'package:study_flow/domain/repositories/user/user_repository.dart'
    as _i5;
import 'package:study_flow/domain/usecases/get_user_in_local_storage_usecase.dart'
    as _i7;
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart'
    as _i8;

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
    gh.factory<_i4.SharedPreferencesImpl>(() => _i4.SharedPreferencesImpl());
    gh.factory<_i4.SharedPrefDatasource>(() => _i4.SharedPrefDatasourceImpl(
        sharedPreferencesImpl: gh<_i4.SharedPreferencesImpl>()));
    gh.lazySingleton<_i5.UserRepository>(() => _i6.UserRepositoryImpl(
        userLocalDataSource: gh<_i4.SharedPrefDatasource>()));
    gh.lazySingleton<_i7.GetUserInLocalStorageUsecase>(() =>
        _i7.GetUserInLocalStorageUsecase(
            userRepository: gh<_i5.UserRepository>()));
    gh.factory<_i8.GetUserInLocalStorageBloc>(() =>
        _i8.GetUserInLocalStorageBloc(
            getUserInLocalStorageUsecase:
                gh<_i7.GetUserInLocalStorageUsecase>()));
    return this;
  }
}
