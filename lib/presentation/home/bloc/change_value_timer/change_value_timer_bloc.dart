import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'change_value_timer_event.dart';
part 'change_value_timer_state.dart';

@injectable
class ChangeValueTimerBloc
    extends Bloc<ChangeValueTimerEvent, ChangeValueTimerState> {
  ChangeValueTimerBloc() : super(const ChangeValueTimerState()) {
    on<ChangeValueTimerEventIncrement>(_changeValueTimer);
  }

  void _changeValueTimer(
    ChangeValueTimerEventIncrement event,
    Emitter<ChangeValueTimerState> emit,
  ) {
    emit(state.copyWith(value: event.value));
  }
}
