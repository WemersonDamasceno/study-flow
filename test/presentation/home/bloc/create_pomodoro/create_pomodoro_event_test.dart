import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';

void main() {
  group('CreatePomodoroEvent', () {
    const pomodoro1 = PomodoroEntity(
      id: 1,
      priority: "ALTA",
      userId: 1,
      quantityRepeat: 5,
      title: "Teste 01",
      timeOfRepeat: 0,
    );

    const pomodoro2 = PomodoroEntity(
      id: 2,
      priority: "ALTA",
      userId: 2,
      quantityRepeat: 5,
      title: "Teste 02",
      timeOfRepeat: 0,
    );

    test('supports pomodoroEntity comparison', () {
      // Arrange
      const event1 = CreatePomodoro(pomodoroEntity: pomodoro2);
      const event2 = CreatePomodoro(pomodoroEntity: pomodoro2);
      const event3 = CreatePomodoro(pomodoroEntity: pomodoro1);

      // Act & Assert
      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });

    test('props contains the pomodoroEntity', () {
      // Arrange
      const event = CreatePomodoro(pomodoroEntity: pomodoro2);

      // Act & Assert
      expect(event.props, contains(pomodoro2));
    });
  });
}
