import 'package:dartz/dartz.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';

abstract class PomodoroRepository {
  Future<Either<Failure, List<PomodoroEntity>>> getAllPomodoros(String userId);
  Future<Either<Failure, bool>> savePomodoro(PomodoroEntity pomodoro);
  Future<Either<Failure, bool>> deletePomodoro({
    required String userId,
    required String pomodoroId,
  });
}
