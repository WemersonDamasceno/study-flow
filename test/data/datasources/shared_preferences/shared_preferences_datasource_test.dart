import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';
import 'package:study_flow/core/errors/exceptions.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late SharedPrefDatasourceImpl datasource;
  late SharedPreferences mockSharedPreferences;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    datasource = SharedPrefDatasourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  const token = "A3X-42G-M1NDTR1X-789";

  const key = SharedPrefKeysEnum.token;

  group('getToken', () {
    test('should return UserModel from SharedPreferences', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(key.toString()))
          .thenReturn(token);

      // Act
      final result = await datasource.getToken(key);

      // Assert
      expect(result, equals(token));
      verify(() => mockSharedPreferences.getString(key.toString())).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should return null when SharedPreferences returns null', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(key.toString()))
          .thenReturn(null);

      // Act
      final result = await datasource.getToken(key);

      // Assert
      expect(result, isNull);
      verify(() => mockSharedPreferences.getString(key.toString())).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should throw an exception if an error occurs', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(key.toString()))
          .thenThrow(Exception());

      // Act & Assert
      expect(() async => await datasource.getToken(key), throwsException);
      verify(() => mockSharedPreferences.getString(key.toString())).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });

  group('saveToken', () {
    test('should save UserModel to SharedPreferences', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(key.toString(), token))
          .thenAnswer((_) => Future.value(true));

      // Act
      final result = await datasource.saveToken(key, token);

      // Assert
      expect(result, isTrue);
      verify(() => mockSharedPreferences.setString(key.toString(), token))
          .called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should throw an exception if an error occurs', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(key.toString(), token))
          .thenThrow(Exception());

      // Act & Assert
      expect(
          () async => await datasource.saveToken(key, token), throwsException);
      verify(() => mockSharedPreferences.setString(key.toString(), token))
          .called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });

  group('removeToken', () {
    test('should remove key from SharedPreferences', () async {
      // Arrange
      when(() => mockSharedPreferences.remove(key.toString()))
          .thenAnswer((_) => Future.value(true));

      // Act
      final result = await datasource.removeToken(key);

      // Assert
      expect(result, isTrue);
      verify(() => mockSharedPreferences.remove(key.toString())).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('should throw an exception if an error occurs', () async {
      // Arrange
      when(() => mockSharedPreferences.remove(key.toString()))
          .thenThrow(const LocalStorageException());

      // Act & Assert
      expect(() async => await datasource.removeToken(key), throwsException);
      verify(() => mockSharedPreferences.remove(key.toString())).called(1);
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });
}
