import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';

void main() {
  group('ChangeValueTimerEventIncrement', () {
    test('supports value comparison', () {
      // Arrange
      const event1 = ChangeValueTimerEventIncrement(value: 5);
      const event2 = ChangeValueTimerEventIncrement(value: 5);
      const event3 = ChangeValueTimerEventIncrement(value: 10);

      // Act & Assert
      expect(event1, equals(event2)); // Teste de igualdade
      expect(event1, isNot(equals(event3))); // Teste de desigualdade
    });

    test('props contains the value', () {
      // Arrange
      const event = ChangeValueTimerEventIncrement(value: 8);

      // Act & Assert
      expect(event.props,
          contains(8)); // Verifica se a lista de props contém o valor
    });

    test('isA<ChangeValueTimerEvent>', () {
      // Arrange
      const event = ChangeValueTimerEventIncrement(value: 5);

      // Act & Assert
      expect(event,
          isA<ChangeValueTimerEvent>()); // Verifica se é uma instância de ChangeValueTimerEvent
    });
  });
}
