import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('ButtonManagerStatus', () {
    test('should create ButtonManagerStatus with the given status', () {
      // Arrange
      const customStatus = StatusEnum.loading;
      const buttonManagerStatus = ButtonManagerStatus(status: customStatus);

      // Act

      // Assert
      expect(buttonManagerStatus.status, equals(customStatus));
    });

    test('should return true for equality when two events are the same', () {
      // Arrange
      const event1 = ButtonManagerStatus(status: StatusEnum.success);
      const event2 = ButtonManagerStatus(status: StatusEnum.success);

      // Act

      // Assert
      expect(event1, equals(event2));
    });

    test('should return false for equality when two events are different', () {
      // Arrange
      const event1 = ButtonManagerStatus(status: StatusEnum.success);
      const event2 = ButtonManagerStatus(status: StatusEnum.loading);

      // Act

      // Assert
      expect(event1, isNot(equals(event2)));
    });
  });
}
