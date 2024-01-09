// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:study_flow/core/database_helper/database_helper.dart' as _i6;
import 'package:study_flow/core/session/session.dart' as _i14;
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart'
    as _i3;
import 'package:study_flow/data/datasources/local_storage/pomodoro_datasource.dart'
    as _i8;
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart'
    as _i16;
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart'
    as _i15;
import 'package:study_flow/data/repositories/pomodoro/pomodoro_repository_impl.dart'
    as _i10;
import 'package:study_flow/data/repositories/user/user_repository_impl.dart'
    as _i21;
import 'package:study_flow/domain/repositories/pomodoro/pomodoro_repository.dart'
    as _i9;
import 'package:study_flow/domain/repositories/user/user_repository.dart'
    as _i20;
import 'package:study_flow/domain/usecases/home/change_state_button_usecase.dart'
    as _i4;
import 'package:study_flow/domain/usecases/pomodoro/delete_pomodoro_usecase.dart'
    as _i18;
import 'package:study_flow/domain/usecases/pomodoro/get_all_pomodoro_usecase.dart'
    as _i19;
import 'package:study_flow/domain/usecases/pomodoro/save_pomodoro_usecase.dart'
    as _i12;
import 'package:study_flow/domain/usecases/token/get_token_in_local_storage_usecase.dart'
    as _i23;
import 'package:study_flow/domain/usecases/token/remove_token_in_local_storage_usecase.dart'
    as _i25;
import 'package:study_flow/domain/usecases/token/save_token_in_local_storage_usecase.dart'
    as _i26;
import 'package:study_flow/domain/usecases/user/get_user_usecase.dart' as _i24;
import 'package:study_flow/domain/usecases/user/save_user_usecase.dart' as _i27;
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart'
    as _i31;
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart'
    as _i32;
import 'package:study_flow/presentation/home/bloc/bloc/manager_button_main_bloc.dart'
    as _i7;
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart'
    as _i5;
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart'
    as _i17;
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart'
    as _i22;
import 'package:study_flow/presentation/home/bloc/get_token/get_token_bloc.dart'
    as _i28;
import 'package:study_flow/presentation/home/bloc/get_user/get_user_bloc.dart'
    as _i30;
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart'
    as _i13;
import 'package:study_flow/presentation/home/controller/quantity_controller.dart'
    as _i11;
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart'
    as _i29;

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
    gh.factory<_i4.ChangeStateButtonUsecase>(
        () => _i4.ChangeStateButtonUsecase());
    gh.factory<_i5.ChangeValueTimerBloc>(() => _i5.ChangeValueTimerBloc());
    gh.factory<_i6.DatabaseHelper>(() => _i6.DatabaseHelper());
    gh.factory<_i7.ManagerButtonMainBloc>(
        () => _i7.ManagerButtonMainBloc(gh<_i4.ChangeStateButtonUsecase>()));
    gh.factory<_i8.PomodoroDatasource>(() =>
        _i8.PomodoroDatasourceImpl(databaseHelper: gh<_i6.DatabaseHelper>()));
    gh.lazySingleton<_i9.PomodoroRepository>(() => _i10.PomodoroRepositoryImpl(
        pomodoroDataSource: gh<_i8.PomodoroDatasource>()));
    gh.factory<_i11.QuantityController>(() => _i11.QuantityController());
    gh.lazySingleton<_i12.SavePomodoroUsecase>(() => _i12.SavePomodoroUsecase(
        pomodoroRepository: gh<_i9.PomodoroRepository>()));
    gh.factory<_i13.SelectTagPriorityBloc>(() => _i13.SelectTagPriorityBloc());
    gh.singleton<_i14.Session>(_i14.Session());
    gh.factory<_i15.SharedPrefImpl>(() => _i15.SharedPrefImpl());
    gh.factory<_i16.SqliteDataSource>(() =>
        _i16.SqliteDatasourceImpl(databaseHelper: gh<_i6.DatabaseHelper>()));
    gh.factory<_i17.CreatePomodoroBloc>(() => _i17.CreatePomodoroBloc(
        savePomodoroUsecase: gh<_i12.SavePomodoroUsecase>()));
    gh.lazySingleton<_i18.DeletePomodoroUsecase>(() =>
        _i18.DeletePomodoroUsecase(
            pomodoroRepository: gh<_i9.PomodoroRepository>()));
    gh.lazySingleton<_i19.GetAllPomodoroUsecase>(() =>
        _i19.GetAllPomodoroUsecase(
            pomodoroRepository: gh<_i9.PomodoroRepository>()));
    gh.factory<_i15.SharedPrefDatasource>(() => _i15.SharedPrefDatasourceImpl(
        sharedPreferences: gh<_i15.SharedPrefImpl>()));
    gh.lazySingleton<_i20.UserRepository>(() => _i21.UserRepositoryImpl(
          sqliteDataSource: gh<_i16.SqliteDataSource>(),
          sharedPreferencesDataSource: gh<_i15.SharedPrefDatasource>(),
        ));
    gh.factory<_i22.GetAllPomodoroBloc>(() => _i22.GetAllPomodoroBloc(
        getAllPomodoroUsecase: gh<_i19.GetAllPomodoroUsecase>()));
    gh.lazySingleton<_i23.GetTokenInLocalStorageUsecase>(() =>
        _i23.GetTokenInLocalStorageUsecase(
            userRepository: gh<_i20.UserRepository>()));
    gh.lazySingleton<_i24.GetUserUsecase>(
        () => _i24.GetUserUsecase(gh<_i20.UserRepository>()));
    gh.lazySingleton<_i25.RemoveTokenInLocalStorageUsecase>(() =>
        _i25.RemoveTokenInLocalStorageUsecase(
            userRepository: gh<_i20.UserRepository>()));
    gh.lazySingleton<_i26.SaveTokenInLocalStorageUsecase>(() =>
        _i26.SaveTokenInLocalStorageUsecase(
            userRepository: gh<_i20.UserRepository>()));
    gh.lazySingleton<_i27.SaveUserUsecase>(
        () => _i27.SaveUserUsecase(userRepository: gh<_i20.UserRepository>()));
    gh.factory<_i28.GetTokenBloc>(() => _i28.GetTokenBloc(
        getUserInLocalStorageUsecase:
            gh<_i23.GetTokenInLocalStorageUsecase>()));
    gh.factory<_i29.GetTokenInLocalStorageBloc>(() =>
        _i29.GetTokenInLocalStorageBloc(
            getUserInLocalStorageUsecase:
                gh<_i23.GetTokenInLocalStorageUsecase>()));
    gh.factory<_i30.GetUserBloc>(
        () => _i30.GetUserBloc(getUserUsecase: gh<_i24.GetUserUsecase>()));
    gh.factory<_i31.SaveTokenBloc>(() => _i31.SaveTokenBloc(
        saveTokenInLocalStorageUsecase:
            gh<_i26.SaveTokenInLocalStorageUsecase>()));
    gh.factory<_i32.SaveUserLocalStorageBloc>(() =>
        _i32.SaveUserLocalStorageBloc(
            saveUserUsecase: gh<_i27.SaveUserUsecase>()));
    return this;
  }
}
