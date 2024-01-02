import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:test/test.dart';

void main() {
  const String userId = '1';
  const String userName = 'John Doe';
  const String userEmail = 'john.doe@example.com';

  group('UserEntity', () {
    test('should create a UserEntity instance', () {
      // Arrange
      const userEntity =
          UserEntity(id: userId, name: userName, email: userEmail);

      // Assert
      expect(userEntity, isA<UserEntity>());
      expect(userEntity.id, equals(userId));
      expect(userEntity.name, equals(userName));
      expect(userEntity.email, equals(userEmail));
    });

    test('copyWith should create a new UserEntity with updated values', () {
      // Arrange
      const originalUserEntity =
          UserEntity(id: userId, name: userName, email: userEmail);

      // Act
      final updatedUserEntity =
          originalUserEntity.copyWith(name: 'Updated Name');

      // Assert
      expect(updatedUserEntity, isA<UserEntity>());
      expect(updatedUserEntity.id, equals(userId));
      expect(updatedUserEntity.name, equals('Updated Name'));
      expect(updatedUserEntity.email, equals(userEmail));
    });

    test('props should contain id, name, and email', () {
      // Arrange
      const userEntity =
          UserEntity(id: userId, name: userName, email: userEmail);

      // Assert
      expect(userEntity.props, contains(userId));
      expect(userEntity.props, contains(userName));
      expect(userEntity.props, contains(userEmail));
    });

    test(
        'copyWith should return the same instance if no properties are updated',
        () {
      // Arrange
      const userEntity = UserEntity(
        id: userId,
        name: userName,
        email: userEmail,
      );

      // Act
      final unchangedUserEntity = userEntity.copyWith();

      // Assert
      expect(unchangedUserEntity, userEntity);
    });
  });
}
