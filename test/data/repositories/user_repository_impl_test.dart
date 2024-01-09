import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';
import 'package:study_flow/core/errors/exceptions.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';
import 'package:study_flow/data/repositories/user/user_repository_impl.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

class MockSharedPrefDatasource extends Mock implements SharedPrefDatasource {}

class MockSqliteDatasource extends Mock implements SqliteDataSource {}

void main() {
  late UserRepository userRepository;
  late SharedPrefDatasource mockUserLocalDataSource;
  late SqliteDataSource mockSqliteDataSource;

  const tokenUser = "A3X-42G-M1NDTR1X-789";

  setUp(() {
    mockUserLocalDataSource = MockSharedPrefDatasource();
    mockSqliteDataSource = MockSqliteDatasource();
    userRepository = UserRepositoryImpl(
      sharedPreferencesDataSource: mockUserLocalDataSource,
      sqliteDataSource: mockSqliteDataSource,
    );
  });

  group('getToken', () {
    test('should return user entity from local data source', () async {
      // Arrange

      when(() => mockUserLocalDataSource.getToken(SharedPrefKeysEnum.token))
          .thenAnswer((_) async => tokenUser);

      // Act
      final result = await userRepository.getToken();

      // Assert
      expect(result, equals(const Right(tokenUser)));
      verify(() => mockUserLocalDataSource.getToken(SharedPrefKeysEnum.token))
          .called(1);
      verifyNoMoreInteractions(mockUserLocalDataSource);
    });

    test('should return a failure when an exception occurs', () async {
      // Arrange
      when(() => mockUserLocalDataSource.getToken(SharedPrefKeysEnum.token))
          .thenThrow(Exception());

      // Act
      final result = await userRepository.getToken();

      // Assert

      expect(result.fold((l) => l, (r) => null),
          const SharedPrefFailure(message: 'Error reading token.'));
      verify(() => mockUserLocalDataSource.getToken(SharedPrefKeysEnum.token))
          .called(1);
      verifyNoMoreInteractions(mockUserLocalDataSource);
    });
  });

  group('removeToken', () {
    test('should remove token from local data source', () async {
      // Arrange
      when(() => mockUserLocalDataSource.removeToken(SharedPrefKeysEnum.token))
          .thenAnswer((_) async {
        return true;
      });

      // Act
      final result = await userRepository.removeToken();

      // Assert
      expect(result, equals(const Right(true)));
      verify(() =>
              mockUserLocalDataSource.removeToken(SharedPrefKeysEnum.token))
          .called(1);
      verifyNoMoreInteractions(mockUserLocalDataSource);
    });

    test('should return a failure when an exception occurs', () async {
      // Arrange
      when(() => mockUserLocalDataSource.removeToken(SharedPrefKeysEnum.token))
          .thenThrow(
              const LocalStorageException(message: 'Error removing token.'));

      // Act
      final result = await userRepository.removeToken();

      // Assert

      expect(result.fold((l) => l, (r) => null),
          const SharedPrefFailure(message: 'Error removing token.'));
    });
  });

  group('saveToken', () {
    test('should save token to local data source', () async {
      // Arrange
      const token = 'sample_token';
      when(() => mockUserLocalDataSource.saveToken(
          SharedPrefKeysEnum.token, token)).thenAnswer((_) async {
        return true;
      });

      // Act
      final result = await userRepository.saveToken(token);

      // Assert
      expect(result, equals(const Right(true)));
      verify(() => mockUserLocalDataSource.saveToken(
          SharedPrefKeysEnum.token, token)).called(1);
      verifyNoMoreInteractions(mockUserLocalDataSource);
    });

    test('should return a failure when an exception occurs', () async {
      // Arrange
      const token = 'sample_token';
      when(() => mockUserLocalDataSource.saveToken(
          SharedPrefKeysEnum.token, token)).thenThrow(Exception());

      // Act
      final result = await userRepository.saveToken(token);

      // Assert
      expect(
          result,
          equals(
              const Left(SharedPrefFailure(message: 'Error saving token.'))));
      verify(() => mockUserLocalDataSource.saveToken(
          SharedPrefKeysEnum.token, token)).called(1);
      verifyNoMoreInteractions(mockUserLocalDataSource);
    });
  });
}
