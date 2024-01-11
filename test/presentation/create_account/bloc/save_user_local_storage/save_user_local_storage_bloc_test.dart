import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/usecases/user/save_user_usecase.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';

import '../../../../mocks/user_mock.dart';

class MockSaveUserUsecase extends Mock implements SaveUserUsecase {}

void main() {
  late SaveUserLocalStorageBloc saveUserLocalStorageBloc;
  late MockSaveUserUsecase mockSaveUserUsecase;

  setUp(() {
    mockSaveUserUsecase = MockSaveUserUsecase();
    saveUserLocalStorageBloc = SaveUserLocalStorageBloc(
      saveUserUsecase: mockSaveUserUsecase,
    );
  });

  final userEntity = UserMock.entity;

  blocTest<SaveUserLocalStorageBloc, SaveUserLocalStorageState>(
    'emits [Loading, Error] when SaveUserUsecase returns a failure',
    build: () {
      when(() => mockSaveUserUsecase(SaveUserParams(user: userEntity)))
          .thenAnswer((_) async =>
              const Left(SqliteFailure(message: 'Error saving user.')));
      return saveUserLocalStorageBloc;
    },
    act: (bloc) => bloc.add(SaveUserLocalStorage(userEntity: userEntity)),
    expect: () => const [
      SaveUserLocalStorageState(status: StatusEnum.loading),
      SaveUserLocalStorageState(status: StatusEnum.error),
    ],
  );

  blocTest<SaveUserLocalStorageBloc, SaveUserLocalStorageState>(
    'emits [Loading, Initial, Success] when SaveUserUsecase returns a success',
    build: () {
      when(() => mockSaveUserUsecase(SaveUserParams(user: userEntity)))
          .thenAnswer((_) async => Right(userEntity));
      return saveUserLocalStorageBloc;
    },
    act: (bloc) => bloc.add(SaveUserLocalStorage(userEntity: userEntity)),
    expect: () => [
      const SaveUserLocalStorageState(status: StatusEnum.loading),
      const SaveUserLocalStorageState(status: StatusEnum.initial),
      SaveUserLocalStorageState(
        status: StatusEnum.success,
        userEntity: userEntity,
      ),
    ],
  );
}
