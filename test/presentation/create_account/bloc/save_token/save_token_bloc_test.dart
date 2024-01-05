import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/usecases/token/save_token_in_local_storage_usecase.dart';
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart';

class MockSaveTokenInLocalStorageUsecase extends Mock
    implements SaveTokenInLocalStorageUsecase {}

void main() {
  late SaveTokenBloc saveTokenBloc;
  late MockSaveTokenInLocalStorageUsecase mockSaveTokenInLocalStorageUsecase;

  setUp(() {
    mockSaveTokenInLocalStorageUsecase = MockSaveTokenInLocalStorageUsecase();
    saveTokenBloc = SaveTokenBloc(
      saveTokenInLocalStorageUsecase: mockSaveTokenInLocalStorageUsecase,
    );
  });

  blocTest<SaveTokenBloc, SaveTokenState>(
    'emits [Loading, Error] when SaveTokenInLocalStorageUsecase returns a failure',
    build: () {
      when(() => mockSaveTokenInLocalStorageUsecase(
              const SaveTokenInLocalStorageParams(token: 'yourToken')))
          .thenAnswer((_) async => const Left(
                SharedPrefFailure(message: 'Error saving token.'),
              ));
      return saveTokenBloc;
    },
    act: (bloc) => bloc.add(const SaveToken(token: 'yourToken')),
    expect: () => const [
      SaveTokenState(status: StatusEnum.loading),
      SaveTokenState(status: StatusEnum.error),
    ],
  );

  blocTest<SaveTokenBloc, SaveTokenState>(
    'emits [Loading, Initial, Success] when SaveTokenInLocalStorageUsecase returns a success',
    build: () {
      when(() => mockSaveTokenInLocalStorageUsecase(
              const SaveTokenInLocalStorageParams(token: 'yourToken')))
          .thenAnswer((_) async => const Right(true));
      return saveTokenBloc;
    },
    act: (bloc) => bloc.add(const SaveToken(token: 'yourToken')),
    expect: () => const [
      SaveTokenState(status: StatusEnum.loading),
      SaveTokenState(status: StatusEnum.initial),
      SaveTokenState(status: StatusEnum.success),
    ],
  );
}
