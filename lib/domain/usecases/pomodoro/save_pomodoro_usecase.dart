import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/domain/repositories/pomodoro/pomodoro_repository.dart';

@lazySingleton
class SavePomodoroUsecase implements UseCase<bool, SavePomodoroUsecaseParams> {
  final PomodoroRepository _pomodoroRepository;

  SavePomodoroUsecase({required PomodoroRepository pomodoroRepository})
      : _pomodoroRepository = pomodoroRepository;

  @override
  Future<Either<Failure, bool>> call(SavePomodoroUsecaseParams params) async {
    return await _pomodoroRepository.savePomodoro(
      params.pomodoroEntity,
    );
  }
}

class SavePomodoroUsecaseParams {
  final PomodoroEntity pomodoroEntity;

  SavePomodoroUsecaseParams({required this.pomodoroEntity});
}
