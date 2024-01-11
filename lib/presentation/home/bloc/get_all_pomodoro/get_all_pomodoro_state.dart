part of 'get_all_pomodoro_bloc.dart';

class GetAllPomodoroState extends Equatable {
  final StatusEnum status;
  final List<PomodoroEntity>? pomodoros;

  const GetAllPomodoroState({
    this.status = StatusEnum.initial,
    this.pomodoros,
  });

  GetAllPomodoroState copyWith({
    StatusEnum? status,
    List<PomodoroEntity>? pomodoros,
  }) {
    return GetAllPomodoroState(
      status: status ?? this.status,
      pomodoros: pomodoros ?? this.pomodoros,
    );
  }

  @override
  List<Object?> get props => [status, pomodoros];
}
