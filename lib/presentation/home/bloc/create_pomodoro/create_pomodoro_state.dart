part of 'create_pomodoro_bloc.dart';

class CreatePomodoroState extends Equatable {
  final StatusEnum status;

  const CreatePomodoroState({this.status = StatusEnum.initial});

  @override
  List<Object> get props => [status];

  CreatePomodoroState copyWith({
    StatusEnum? status,
  }) {
    return CreatePomodoroState(
      status: status ?? this.status,
    );
  }
}
