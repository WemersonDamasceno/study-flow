import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';

void main() {
  group('CreatePomodoroState', () {
    test('supports status comparison', () {
      // Arrange
      const state1 = CreatePomodoroState(status: StatusEnum.initial);
      const state2 = CreatePomodoroState(status: StatusEnum.initial);
      const state3 = CreatePomodoroState(status: StatusEnum.loading);

      // Act & Assert
      expect(state1, equals(state2));
      expect(state1, isNot(equals(state3)));
    });

    test('copyWith creates a new instance with the provided status', () {
      // Arrange
      const originalState = CreatePomodoroState(status: StatusEnum.success);

      // Act
      final newState = originalState.copyWith(status: StatusEnum.error);

      // Assert
      expect(newState.status, equals(StatusEnum.error));
      expect(newState, isNot(same(originalState)));
    });

    test(
        'copyWith creates an instance with the same status if no new status is provided',
        () {
      // Arrange
      const originalState = CreatePomodoroState(status: StatusEnum.loading);

      // Act
      final newState = originalState.copyWith();

      // Assert
      expect(newState.status, equals(StatusEnum.loading));
    });
  });
}
