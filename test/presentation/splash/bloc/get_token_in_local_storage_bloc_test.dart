import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/domain/usecases/token/get_token_in_local_storage_usecase.dart';
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart';

class MockGetUserInLocalStorageUsecase extends Mock
    implements GetTokenInLocalStorageUsecase {}

void main() {
  late GetTokenInLocalStorageUsecase mockUsecase;
  late GetTokenInLocalStorageBloc getUserInLocalStorageBloc;

  const tokenUser = "123";

  setUp(() async {
    mockUsecase = MockGetUserInLocalStorageUsecase();
    getUserInLocalStorageBloc = GetTokenInLocalStorageBloc(
      getUserInLocalStorageUsecase: mockUsecase,
    );

    await getIt.reset();
    getIt.registerLazySingleton<GetTokenInLocalStorageUsecase>(
      () => mockUsecase,
    );
    getIt.registerFactory<GetTokenInLocalStorageBloc>(
      () => getUserInLocalStorageBloc,
    );
  });

  tearDownAll(() {
    getUserInLocalStorageBloc.close();
  });

  blocTest<GetTokenInLocalStorageBloc, GetTokenInLocalStorageState>(
    'emits [loading, success] state when GetUserInLocalStorage is successful',
    setUp: () {
      when(() => mockUsecase(NoParams()))
          .thenAnswer((_) => Future.value(const Right(tokenUser)));
    },
    wait: const Duration(seconds: 3),
    build: () => getUserInLocalStorageBloc,
    act: (bloc) => bloc.add(const GetUserInLocalStorage(key: 'test_key')),
    expect: () => [
      const GetTokenInLocalStorageState(status: StatusEnum.loading),
      const GetTokenInLocalStorageState(status: StatusEnum.initial),
      const GetTokenInLocalStorageState(
        status: StatusEnum.success,
        token: tokenUser,
      )
    ],
  );

  blocTest<GetTokenInLocalStorageBloc, GetTokenInLocalStorageState>(
    'emits [loading, empty] state when GetUserInLocalStorage is successful',
    setUp: () {
      when(() => mockUsecase(NoParams()))
          .thenAnswer((_) => Future.value(const Right(null)));
    },
    build: () => getUserInLocalStorageBloc,
    act: (bloc) => bloc.add(const GetUserInLocalStorage(key: 'test_key')),
    wait: const Duration(seconds: 3),
    expect: () => [
      const GetTokenInLocalStorageState(status: StatusEnum.loading),
      const GetTokenInLocalStorageState(status: StatusEnum.initial),
      const GetTokenInLocalStorageState(
        status: StatusEnum.empty,
        token: null,
      )
    ],
  );

  blocTest<GetTokenInLocalStorageBloc, GetTokenInLocalStorageState>(
    'emits [loading, error] state when GetUserInLocalStorage throws an exception',
    setUp: () {
      when(() => mockUsecase(NoParams())).thenAnswer(
        (_) async => const Left(SharedPrefFailure(
          message: 'An error occurred',
        )),
      );
    },
    wait: const Duration(seconds: 3),
    build: () => getUserInLocalStorageBloc,
    act: (bloc) => bloc.add(const GetUserInLocalStorage(key: 'test_key')),
    expect: () => [
      const GetTokenInLocalStorageState(status: StatusEnum.loading),
      const GetTokenInLocalStorageState(status: StatusEnum.error)
    ],
  );
}
