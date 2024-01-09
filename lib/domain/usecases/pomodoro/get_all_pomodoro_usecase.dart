import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/domain/repositories/pomodoro/pomodoro_repository.dart';

@lazySingleton
class GetAllPomodoroUsecase
    implements UseCase<List<PomodoroEntity>, GetAllPomodoroUsecaseParams> {
  final PomodoroRepository _pomodoroRepository;

  GetAllPomodoroUsecase({required PomodoroRepository pomodoroRepository})
      : _pomodoroRepository = pomodoroRepository;

  @override
  Future<Either<Failure, List<PomodoroEntity>>> call(
      GetAllPomodoroUsecaseParams params) async {
    return await _pomodoroRepository.getAllPomodoros(
      params.userId,
    );
  }
}

class GetAllPomodoroUsecaseParams {
  final String userId;

  GetAllPomodoroUsecaseParams({required this.userId});
}
