import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';

void main() {
  late ButtonManagerStatusBloc bloc;

  setUp(() {
    bloc = ButtonManagerStatusBloc();
  });

  tearDown(() {
    bloc.close();
  });
  group('ButtonManagerStatusBloc', () {
    test('initial state should be ButtonManagerStatusState()', () {
      // Assert
      expect(bloc.state, equals(const ButtonManagerStatusState()));
    });

    blocTest<ButtonManagerStatusBloc, ButtonManagerStatusState>(
      'emits [ButtonManagerStatusState(status: customStatus)] when ButtonManagerStatus is added',
      build: () => bloc,
      act: (bloc) => bloc.add(
        const ButtonManagerStatus(status: StatusEnum.success),
      ),
      expect: () => [
        const ButtonManagerStatusState(status: StatusEnum.success),
      ],
    );
  });
}
