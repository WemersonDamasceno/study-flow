import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/exceptions.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/data/datasources/local_storage/pomodoro_datasource.dart';
import 'package:study_flow/data/models/pomodoro/pomodoro_model.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/domain/repositories/pomodoro/pomodoro_repository.dart';

@LazySingleton(as: PomodoroRepository)
class PomodoroRepositoryImpl implements PomodoroRepository {
  final PomodoroDatasource _pomodoroDataSource;

  PomodoroRepositoryImpl({
    required PomodoroDatasource pomodoroDataSource,
  }) : _pomodoroDataSource = pomodoroDataSource;

  @override
  Future<Either<Failure, List<PomodoroEntity>>> getAllPomodoros(
      String userId) async {
    try {
      final pomodoros = await _pomodoroDataSource.getAllPomodoros(userId);
      return Right(pomodoros);
    } on LocalStorageException {
      return const Left(SqliteFailure(message: 'Error to get pomodoros'));
    }
  }

  @override
  Future<Either<Failure, bool>> savePomodoro(PomodoroEntity pomodoro) async {
    try {
      final result = await _pomodoroDataSource.savePomodoro(
        PomodoroModel.fromEntity(pomodoro),
      );
      return Right(result);
    } on LocalStorageException {
      return const Left(SqliteFailure(message: 'Error to save pomodoro'));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePomodoro(
      {required String userId, required String pomodoroId}) async {
    try {
      final result = await _pomodoroDataSource.deletePomodoro(
        userId: userId,
        pomodoroId: pomodoroId,
      );
      return Right(result);
    } on LocalStorageException {
      return const Left(SqliteFailure(message: 'Error to delete pomodoro'));
    }
  }
}
