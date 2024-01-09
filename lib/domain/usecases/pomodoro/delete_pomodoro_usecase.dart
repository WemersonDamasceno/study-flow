import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/repositories/pomodoro/pomodoro_repository.dart';

@lazySingleton
class DeletePomodoroUsecase
    implements UseCase<bool, DeletePomodoroUsecaseParams> {
  final PomodoroRepository _pomodoroRepository;

  DeletePomodoroUsecase({required PomodoroRepository pomodoroRepository})
      : _pomodoroRepository = pomodoroRepository;

  @override
  Future<Either<Failure, bool>> call(DeletePomodoroUsecaseParams params) async {
    return await _pomodoroRepository.deletePomodoro(
      userId: params.userId,
      pomodoroId: params.pomodoroId,
    );
  }
}

class DeletePomodoroUsecaseParams extends Equatable {
  final String userId;
  final String pomodoroId;

  const DeletePomodoroUsecaseParams(
      {required this.userId, required this.pomodoroId});

  @override
  List<Object?> get props => [userId, pomodoroId];
}
