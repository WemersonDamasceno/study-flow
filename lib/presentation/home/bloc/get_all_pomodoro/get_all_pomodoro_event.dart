part of 'get_all_pomodoro_bloc.dart';

sealed class GetAllPomodoroEvent extends Equatable {
  const GetAllPomodoroEvent();
}

class GetAllPomodoro extends GetAllPomodoroEvent {
  final String? userId;

  const GetAllPomodoro({this.userId});

  @override
  List<Object?> get props => [userId];
}
