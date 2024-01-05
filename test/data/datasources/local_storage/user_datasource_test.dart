import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_flow/core/database_helper/database_helper.dart';
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart';

import '../../../mocks/user_mock.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

// Mock implementation of the Database class
class MockDatabase extends Mock implements Database {}

void main() {
  late SqliteDatasourceImpl sqliteDatasource;
  late MockDatabaseHelper mockDatabaseHelper;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    mockDatabase = MockDatabase();
    sqliteDatasource = SqliteDatasourceImpl(databaseHelper: mockDatabaseHelper);
  });

  final userModel = UserMock.model;
  group('SqliteDatasourceImpl', () {
    test('createUser should insert user into the database', () async {
      //Arrange
      when(() => mockDatabaseHelper.instance)
          .thenAnswer((_) async => mockDatabase);

      when(() => mockDatabase.insert(any(), any())).thenAnswer((_) async => 1);

      //Act
      final result = await sqliteDatasource.createUser(user: userModel);

      //Assert
      expect(result, equals(userModel.copy(id: '1')));
    });
    test('updateUser should update user in the database', () async {
      // Arrange
      when(() => mockDatabaseHelper.instance)
          .thenAnswer((_) async => mockDatabase);
      when(() => mockDatabase.update(any(), any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'))).thenAnswer((_) async => 1);

      // Act
      final result = await sqliteDatasource.updateUser(user: userModel);

      // Assert
      expect(result, equals(userModel.copy(id: '1')));
    });

    test('deleteUser should delete user from the database', () async {
      // Arrange
      when(() => mockDatabaseHelper.instance)
          .thenAnswer((_) async => mockDatabase);
      when(() => mockDatabase.delete(any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'))).thenAnswer((_) async => 1);

      // Act
      final result = await sqliteDatasource.deleteUser(idUser: '1');

      // Assert
      expect(result, equals(true));
    });

    test('getUserById should retrieve user from the database', () async {
      // Arrange
      when(() => mockDatabaseHelper.instance)
          .thenAnswer((_) async => mockDatabase);
      when(() => mockDatabase.query(any(),
              where: any(named: 'where'), whereArgs: any(named: 'whereArgs')))
          .thenAnswer((_) async => [userModel.toJson()]);

      // Act
      final result = await sqliteDatasource.getUserById(idUser: '1');

      // Assert
      expect(result, equals(userModel));
    });
  });
}
