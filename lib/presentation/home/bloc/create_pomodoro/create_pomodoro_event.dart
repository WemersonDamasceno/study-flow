part of 'create_pomodoro_bloc.dart';

sealed class CreatePomodoroEvent extends Equatable {
  const CreatePomodoroEvent();

  @override
  List<Object> get props => [];
}

class CreatePomodoro extends CreatePomodoroEvent {
  final PomodoroEntity pomodoroEntity;

  const CreatePomodoro({required this.pomodoroEntity});
}
