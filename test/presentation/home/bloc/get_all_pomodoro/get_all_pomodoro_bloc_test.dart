import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/usecases/pomodoro/get_all_pomodoro_usecase.dart';
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart';

class MockGetAllPomodoroUsecase extends Mock implements GetAllPomodoroUsecase {}

void main() {
  late GetAllPomodoroBloc getAllPomodoroBloc;
  late MockGetAllPomodoroUsecase mockGetAllPomodoroUsecase;

  setUp(() {
    mockGetAllPomodoroUsecase = MockGetAllPomodoroUsecase();
    getAllPomodoroBloc =
        GetAllPomodoroBloc(getAllPomodoroUsecase: mockGetAllPomodoroUsecase);
  });

  tearDown(() {
    getAllPomodoroBloc.close();
  });
  group('GetAllPomodoroBloc', () {
    blocTest<GetAllPomodoroBloc, GetAllPomodoroState>(
      'emits correct states for GetAllPomodoro event',
      build: () => getAllPomodoroBloc,
      setUp: () {
        when(() => mockGetAllPomodoroUsecase
                .call(const GetAllPomodoroUsecaseParams(userId: 'user1')))
            .thenAnswer((_) async => const Right([]));
      },
      act: (bloc) {
        bloc.add(const GetAllPomodoro(userId: 'user1'));
      },
      expect: () => [
        const GetAllPomodoroState(status: StatusEnum.loading),
        const GetAllPomodoroState(status: StatusEnum.empty, pomodoros: []),
      ],
    );

    blocTest<GetAllPomodoroBloc, GetAllPomodoroState>(
      'emits correct states for GetAllPomodoro event with error',
      build: () => getAllPomodoroBloc,
      setUp: () {
        when(() => mockGetAllPomodoroUsecase
                .call(const GetAllPomodoroUsecaseParams(userId: 'user1')))
            .thenAnswer(
                (_) async => const Left(SqliteFailure(message: "error")));
      },
      act: (bloc) {
        bloc.add(const GetAllPomodoro(userId: 'user1'));
      },
      expect: () => [
        const GetAllPomodoroState(status: StatusEnum.loading),
        const GetAllPomodoroState(status: StatusEnum.error),
      ],
    );
  });
}
