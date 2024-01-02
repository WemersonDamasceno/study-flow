import 'package:study_flow/data/models/user/user_model.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:test/test.dart';

void main() {
  group('UserModel', () {
    const String userId = '1';
    const String userName = 'John Doe';
    const String userEmail = 'john.doe@example.com';

    test('should create a UserModel instance', () {
      // Arrange
      const userModel = UserModel(id: userId, name: userName, email: userEmail);

      // Assert
      expect(userModel, isA<UserModel>());
      expect(userModel.id, equals(userId));
      expect(userModel.name, equals(userName));
      expect(userModel.email, equals(userEmail));
    });

    test('fromJson should create a UserModel from JSON', () {
      // Arrange
      final json = {'id': userId, 'name': userName, 'email': userEmail};

      // Act
      final userModel = UserModel.fromJson(json);

      // Assert
      expect(userModel, isA<UserModel>());
      expect(userModel.id, equals(userId));
      expect(userModel.name, equals(userName));
      expect(userModel.email, equals(userEmail));
    });

    test('toJson should convert a UserModel to JSON', () {
      // Arrange
      const userModel = UserModel(id: userId, name: userName, email: userEmail);

      // Act
      final json = userModel.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], equals(userId));
      expect(json['name'], equals(userName));
      expect(json['email'], equals(userEmail));
    });

    test('fromEntity should create a UserModel from a UserEntity', () {
      // Arrange
      const userEntity =
          UserEntity(id: userId, name: userName, email: userEmail);

      // Act
      final userModel = UserModel.fromEntity(userEntity);

      // Assert
      expect(userModel, isA<UserModel>());
      expect(userModel.id, equals(userId));
      expect(userModel.name, equals(userName));
      expect(userModel.email, equals(userEmail));
    });
  });
}
