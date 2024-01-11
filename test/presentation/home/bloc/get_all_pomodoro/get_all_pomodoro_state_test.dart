import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart';

void main() {
  const pomodoro = PomodoroEntity(
    id: 1,
    title: 'title',
    priority: "low",
    quantityRepeat: 4,
    userId: 1,
    timeOfRepeat: 0,
  );
  group('GetAllPomodoroState', () {
    test('supports status and pomodoros comparison', () {
      // Arrange
      const state1 = GetAllPomodoroState(
        status: StatusEnum.initial,
        pomodoros: [pomodoro],
      );
      const state2 = GetAllPomodoroState(
        status: StatusEnum.initial,
        pomodoros: [pomodoro],
      );
      const state3 = GetAllPomodoroState(
        status: StatusEnum.loading,
        pomodoros: [pomodoro],
      );

      // Act & Assert
      expect(state1, equals(state2));
      expect(state1, isNot(equals(state3)));
    });

    test(
        'copyWith creates a new instance with the provided status and pomodoros',
        () {
      // Arrange
      const originalState = GetAllPomodoroState(
        status: StatusEnum.success,
        pomodoros: [pomodoro],
      );

      // Act
      final newState = originalState
          .copyWith(status: StatusEnum.loading, pomodoros: [pomodoro]);

      // Assert
      expect(newState.status, equals(StatusEnum.loading));
      expect(newState.pomodoros, contains(pomodoro));
      expect(newState, isNot(same(originalState)));
    });

    test(
        'copyWith creates an instance with the same status and pomodoros if no new values are provided',
        () {
      // Arrange
      const originalState = GetAllPomodoroState(
        status: StatusEnum.empty,
        pomodoros: [pomodoro],
      );

      // Act
      final newState = originalState.copyWith();

      // Assert
      expect(newState.status, equals(StatusEnum.empty));
      expect(newState.pomodoros, contains(pomodoro));
    });
  });
}
