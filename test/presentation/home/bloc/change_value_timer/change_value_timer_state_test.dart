import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';

void main() {
  group('ChangeValueTimerState', () {
    test('supports value comparison', () {
      // Arrange
      const state1 = ChangeValueTimerState(value: 10);
      const state2 = ChangeValueTimerState(value: 10);
      const state3 = ChangeValueTimerState(value: 20);

      // Act & Assert
      expect(state1, equals(state2)); // Teste de igualdade
      expect(state1, isNot(equals(state3))); // Teste de desigualdade
    });

    test('copyWith creates a new instance with the provided value', () {
      // Arrange
      const originalState = ChangeValueTimerState(value: 15);

      // Act
      final newState = originalState.copyWith(value: 30);

      // Assert
      expect(newState.value, equals(30.0));
      expect(newState,
          isNot(same(originalState))); // Verifica se é uma nova instância
    });

    test(
        'copyWith creates an instance with the same value if no new value is provided',
        () {
      // Arrange
      const originalState = ChangeValueTimerState(value: 25);

      // Act
      final newState = originalState.copyWith();

      // Assert
      expect(newState.value, equals(25.0));
    });
  });
}
