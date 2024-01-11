part of 'create_pomodoro_bloc.dart';

sealed class CreatePomodoroEvent extends Equatable {
  const CreatePomodoroEvent();
}

class CreatePomodoro extends CreatePomodoroEvent {
  final PomodoroEntity pomodoroEntity;

  const CreatePomodoro({required this.pomodoroEntity});

  @override
  List<Object> get props => [pomodoroEntity];
}
