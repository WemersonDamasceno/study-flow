import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/usecases/get_user_in_local_storage_usecase.dart';
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart';

import '../../../mocks/user_mock.dart';

class MockGetUserInLocalStorageUsecase extends Mock
    implements GetUserInLocalStorageUsecase {}

void main() {
  late GetUserInLocalStorageUsecase mockUsecase;
  late GetUserInLocalStorageBloc getUserInLocalStorageBloc;

  final tUserEntity = UserMock.entity;

  setUp(() {
    mockUsecase = MockGetUserInLocalStorageUsecase();
    getUserInLocalStorageBloc = GetUserInLocalStorageBloc(
      getUserInLocalStorageUsecase: mockUsecase,
    );
  });

  blocTest<GetUserInLocalStorageBloc, GetUserInLocalStorageState>(
    'emits [loading, success] state when GetUserInLocalStorage is successful',
    setUp: () {
      when(() => mockUsecase(
            const GetUserInLocalParams(key: 'test_key'),
          )).thenAnswer((_) => Future.value(Right(tUserEntity)));
    },
    wait: const Duration(seconds: 3),
    build: () => getUserInLocalStorageBloc,
    act: (bloc) => bloc.add(const GetUserInLocalStorage(key: 'test_key')),
    expect: () => [
      const GetUserInLocalStorageState(status: StatusEnum.loading),
      const GetUserInLocalStorageState(status: StatusEnum.initial),
      GetUserInLocalStorageState(
        status: StatusEnum.success,
        userEntity: tUserEntity,
      )
    ],
  );

  blocTest<GetUserInLocalStorageBloc, GetUserInLocalStorageState>(
    'emits [loading, empty] state when GetUserInLocalStorage is successful',
    setUp: () {
      when(() => mockUsecase(
            const GetUserInLocalParams(key: 'test_key'),
          )).thenAnswer((_) => Future.value(const Right(null)));
    },
    wait: const Duration(seconds: 3),
    build: () => getUserInLocalStorageBloc,
    act: (bloc) => bloc.add(const GetUserInLocalStorage(key: 'test_key')),
    expect: () => [
      const GetUserInLocalStorageState(status: StatusEnum.loading),
      const GetUserInLocalStorageState(status: StatusEnum.initial),
      const GetUserInLocalStorageState(
        status: StatusEnum.empty,
        userEntity: null,
      )
    ],
  );

  blocTest<GetUserInLocalStorageBloc, GetUserInLocalStorageState>(
    'emits [loading, error] state when GetUserInLocalStorage throws an exception',
    setUp: () {
      when(() => mockUsecase(
            const GetUserInLocalParams(key: 'test_key'),
          )).thenAnswer(
        (_) async => const Left(SharedPrefFailure(
          message: 'An error occurred',
        )),
      );
    },
    wait: const Duration(seconds: 3),
    build: () => getUserInLocalStorageBloc,
    act: (bloc) => bloc.add(const GetUserInLocalStorage(key: 'test_key')),
    expect: () => [
      const GetUserInLocalStorageState(status: StatusEnum.loading),
      const GetUserInLocalStorageState(status: StatusEnum.error)
    ],
  );
}
