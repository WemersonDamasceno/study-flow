part of 'change_value_timer_bloc.dart';

class ChangeValueTimerState extends Equatable {
  final double value;

  const ChangeValueTimerState({
    this.value = 0,
  });

  ChangeValueTimerState copyWith({
    double? value,
  }) {
    return ChangeValueTimerState(
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [value];
}
