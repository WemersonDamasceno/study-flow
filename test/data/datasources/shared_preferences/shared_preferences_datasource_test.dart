import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';

import '../../../mocks/user_mock.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockSharedPreferencesImpl extends Mock implements SharedPreferencesImpl {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SharedPrefDatasourceImpl datasource;
  late MockSharedPreferencesImpl mockSharedPreferencesImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockSharedPreferencesImpl = MockSharedPreferencesImpl();
    datasource = SharedPrefDatasourceImpl(
        sharedPreferencesImpl: mockSharedPreferencesImpl);
  });

  group('SharedPrefDatasourceImpl', () {
    test('read - should return null if key not found', () async {
      // Arrange
      when(() => mockSharedPreferencesImpl.instance)
          .thenAnswer((_) async => mockSharedPreferences);
      when(() => mockSharedPreferences.getString('user')).thenReturn(null);

      // Act
      final result = await datasource.read('nonexistent_key');

      // Assert
      expect(result, isNull);
      verify(() => mockSharedPreferences.getString('nonexistent_key'))
          .called(1);
    });

    test('read - should return UserModel if key is found', () async {
      // Arrange

      final userModel = UserMock.model;
      final jsonString = json.encode(userModel.toJson());
      when(() => mockSharedPreferencesImpl.instance)
          .thenAnswer((_) async => mockSharedPreferences);
      when(() => mockSharedPreferences.getString('user'))
          .thenReturn(jsonString);

      // Act
      final result = await datasource.read('user');

      // Assert
      expect(result, equals(userModel));
      verify(() => mockSharedPreferences.getString('user')).called(1);
    });
  });
}
