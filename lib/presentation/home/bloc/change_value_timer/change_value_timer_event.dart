part of 'change_value_timer_bloc.dart';

sealed class ChangeValueTimerEvent extends Equatable {
  const ChangeValueTimerEvent();

  @override
  List<Object> get props => [];
}

class ChangeValueTimerEventIncrement extends ChangeValueTimerEvent {
  final int value;

  const ChangeValueTimerEventIncrement({
    required this.value,
  });
}
