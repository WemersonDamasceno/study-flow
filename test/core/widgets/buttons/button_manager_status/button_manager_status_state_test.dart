import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('ButtonManagerStatusState', () {
    test('should create ButtonManagerStatusState with initial status', () {
      // Arrange
      const buttonManagerStatusState = ButtonManagerStatusState();

      // Act

      // Assert
      expect(buttonManagerStatusState.status, equals(StatusEnum.initial));
    });

    test('ButtonManagerStatusState copyWith', () {
      const state = ButtonManagerStatusState(
        status: StatusEnum.success,
      );

      final copiedState = state.copyWith(status: StatusEnum.loading);

      expect(copiedState.status, equals(StatusEnum.loading));
    });

    test('ButtonManagerStatusState copyWith no changes', () {
      const state = ButtonManagerStatusState(
        status: StatusEnum.success,
      );

      final copiedState = state.copyWith();

      expect(copiedState, equals(state));
    });

    test('ButtonManagerStatusState copyWith with changes', () {
      const state = ButtonManagerStatusState(
        status: StatusEnum.success,
      );

      final copiedState = state.copyWith(
        status: StatusEnum.error,
      );

      expect(copiedState.status, equals(StatusEnum.error));
    });

    test('ButtonManagerStatusState props', () {
      const state = ButtonManagerStatusState(
        status: StatusEnum.success,
      );

      expect(state.props, isNotEmpty);
    });
  });
}
