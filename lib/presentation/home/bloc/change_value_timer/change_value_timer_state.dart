part of 'change_value_timer_bloc.dart';

class ChangeValueTimerState extends Equatable {
  final int value;

  const ChangeValueTimerState({
    this.value = 0,
  });

  ChangeValueTimerState copyWith({
    int? value,
  }) {
    return ChangeValueTimerState(
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [value];
}
