import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';

class MockSharedPrefImpl extends Mock implements SharedPrefImpl {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPrefDatasourceImpl dataSource;
  late MockSharedPrefImpl mockSharedPrefImpl;

  setUp(() {
    mockSharedPrefImpl = MockSharedPrefImpl();
    dataSource =
        SharedPrefDatasourceImpl(sharedPreferences: mockSharedPrefImpl);
  });

  group('SharedPrefDatasource', () {
    test('getToken should return null if key not found', () async {
      // Arrange
      final mockSharedPreferences = MockSharedPreferences();
      when(() => mockSharedPrefImpl.instance)
          .thenAnswer((_) async => mockSharedPreferences);
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);

      // Act
      final result = await dataSource.getToken(SharedPrefKeysEnum.inexistent);

      // Assert
      expect(result, isNull);
    });

    test('saveToken should return true after saving token', () async {
      // Arrange
      final mockSharedPreferences = MockSharedPreferences();
      when(() => mockSharedPrefImpl.instance)
          .thenAnswer((_) async => mockSharedPreferences);
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) async => true);

      // Act
      final result =
          await dataSource.saveToken(SharedPrefKeysEnum.token, 'tokenValue');

      // Assert
      expect(result, isTrue);
    });

    test('removeToken should return true after removing token', () async {
      // Arrange
      final mockSharedPreferences = MockSharedPreferences();
      when(() => mockSharedPrefImpl.instance)
          .thenAnswer((_) async => mockSharedPreferences);
      when(() => mockSharedPreferences.remove(any()))
          .thenAnswer((_) async => true);

      // Act
      final result = await dataSource.removeToken(SharedPrefKeysEnum.token);

      // Assert
      expect(result, isTrue);
    });
  });
}
