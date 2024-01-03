import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:test/test.dart';

void main() {
  const String userId = '1';
  const String userName = 'John Doe';

  group('UserEntity', () {
    test('should create a UserEntity instance', () {
      // Arrange
      const userEntity = UserEntity(id: userId, nameUser: userName);

      // Assert
      expect(userEntity, isA<UserEntity>());
      expect(userEntity.id, equals(userId));
      expect(userEntity.nameUser, equals(userName));
    });

    test('copyWith should create a new UserEntity with updated values', () {
      // Arrange
      const originalUserEntity = UserEntity(id: userId, nameUser: userName);

      // Act
      final updatedUserEntity =
          originalUserEntity.copyWith(nameUser: 'Updated Name');

      // Assert
      expect(updatedUserEntity, isA<UserEntity>());
      expect(updatedUserEntity.id, equals(userId));
      expect(updatedUserEntity.nameUser, equals('Updated Name'));
    });

    test('props should contain id, name, and email', () {
      // Arrange
      const userEntity = UserEntity(id: userId, nameUser: userName);

      // Assert
      expect(userEntity.props, contains(userId));
      expect(userEntity.props, contains(userName));
    });

    test(
        'copyWith should return the same instance if no properties are updated',
        () {
      // Arrange
      const userEntity = UserEntity(
        id: userId,
        nameUser: userName,
      );

      // Act
      final unchangedUserEntity = userEntity.copyWith();

      // Assert
      expect(unchangedUserEntity, userEntity);
    });
  });
}
