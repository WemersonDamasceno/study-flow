import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';

void main() {
  group('ChangeValueTimerBloc', () {
    blocTest(
      'emits correct state after ChangeValueTimerEventIncrement',
      build: () => ChangeValueTimerBloc(),
      act: (bloc) => bloc.add(const ChangeValueTimerEventIncrement(value: 120)),
      expect: () => [const ChangeValueTimerState(value: 2)],
    );
  });
}
