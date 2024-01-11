import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart';

void main() {
  group('GetAllPomodoroEvent', () {
    test('supports userId comparison', () {
      // Arrange
      const event1 = GetAllPomodoro(userId: 'user1');
      const event2 = GetAllPomodoro(userId: 'user1');
      const event3 = GetAllPomodoro(userId: 'user2');

      // Act & Assert
      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });

    test('props contains the userId', () {
      // Arrange
      const event = GetAllPomodoro(userId: 'user3');

      // Act & Assert
      expect(event.props, contains('user3'));
    });
  });
}
