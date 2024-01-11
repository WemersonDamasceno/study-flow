import 'package:study_flow/data/models/user/user_model.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:test/test.dart';

void main() {
  group('UserModel', () {
    const int userId = 1;
    const String userName = 'John Doe';

    test('should create a UserModel instance', () {
      // Arrange
      const userModel = UserModel(id: userId, nameUser: userName);

      // Assert
      expect(userModel, isA<UserModel>());
      expect(userModel.id, equals(userId));
      expect(userModel.nameUser, equals(userName));
    });

    test('fromJson should create a UserModel from JSON', () {
      // Arrange
      final json = {'id': userId, 'nameUser': userName};

      // Act
      final userModel = UserModel.fromJson(json);

      // Assert
      expect(userModel, isA<UserModel>());
      expect(userModel.id, equals(userId));
      expect(userModel.nameUser, equals(userName));
    });

    test('toJson should convert a UserModel to JSON', () {
      // Arrange
      const userModel = UserModel(id: userId, nameUser: userName);

      // Act
      final json = userModel.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], equals(userId));
      expect(json['nameUser'], equals(userName));
    });

    test('fromEntity should create a UserModel from a UserEntity', () {
      // Arrange
      const userEntity = UserEntity(id: userId, nameUser: userName);

      // Act
      final userModel = UserModel.fromEntity(userEntity);

      // Assert
      expect(userModel, isA<UserModel>());
      expect(userModel.id, equals(userId));
      expect(userModel.nameUser, equals(userName));
    });

    test('copy should copy a UserModel', () {
      // Arrange
      const userModel = UserModel(id: userId, nameUser: userName);

      // Act
      final copyUserModel = userModel.copy();

      // Assert
      expect(copyUserModel, isA<UserModel>());
      expect(copyUserModel.id, equals(userId));
      expect(copyUserModel.nameUser, equals(userName));
    });
  });
}
