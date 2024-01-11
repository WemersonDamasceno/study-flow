import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/domain/usecases/pomodoro/save_pomodoro_usecase.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';

class MockSavePomodoroUsecase extends Mock implements SavePomodoroUsecase {}

class MockSavePomodoroUsecaseParams extends Fake
    implements SavePomodoroUsecaseParams {}

void main() {
  late CreatePomodoroBloc createPomodoroBloc;
  late SavePomodoroUsecase mockSavePomodoroUsecase;

  const pomodoro = PomodoroEntity(
    id: 1,
    title: 'title',
    priority: "low",
    quantityRepeat: 4,
    userId: 1,
    timeOfRepeat: 0,
  );
  setUp(() {
    mockSavePomodoroUsecase = MockSavePomodoroUsecase();
    createPomodoroBloc = CreatePomodoroBloc(
      savePomodoroUsecase: mockSavePomodoroUsecase,
    );
  });

  setUpAll(() {
    registerFallbackValue(MockSavePomodoroUsecaseParams());
  });

  tearDown(() {
    createPomodoroBloc.close();
  });
  group('CreatePomodoroBloc', () {
    blocTest<CreatePomodoroBloc, CreatePomodoroState>(
      'emits correct states for CreatePomodoro event',
      setUp: () {
        when(() => mockSavePomodoroUsecase(
              const SavePomodoroUsecaseParams(pomodoroEntity: pomodoro),
            )).thenAnswer((_) async => const Right(true));
      },
      build: () => createPomodoroBloc,
      act: (bloc) {
        bloc.add(const CreatePomodoro(pomodoroEntity: pomodoro));
      },
      expect: () => <CreatePomodoroState>[
        const CreatePomodoroState(status: StatusEnum.loading),
        const CreatePomodoroState(status: StatusEnum.success),
      ],
    );

    blocTest<CreatePomodoroBloc, CreatePomodoroState>(
      'emits correct states for CreatePomodoro event',
      setUp: () {
        when(() => mockSavePomodoroUsecase(
                  const SavePomodoroUsecaseParams(pomodoroEntity: pomodoro),
                ))
            .thenAnswer(
                (_) async => const Left(SqliteFailure(message: "error")));
      },
      build: () => createPomodoroBloc,
      act: (bloc) {
        bloc.add(const CreatePomodoro(pomodoroEntity: pomodoro));
      },
      expect: () => <CreatePomodoroState>[
        const CreatePomodoroState(status: StatusEnum.loading),
        const CreatePomodoroState(status: StatusEnum.error),
      ],
    );
  });
}
