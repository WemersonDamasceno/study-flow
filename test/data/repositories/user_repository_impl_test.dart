import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';
import 'package:study_flow/data/repositories/user_repository_impl.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:test/test.dart';

class MockSharedPrefDatasource extends Mock implements SharedPrefDatasource {}

void main() {
  late UserRepositoryImpl userRepository;
  late MockSharedPrefDatasource mockSharedPrefDatasource;

  setUp(() {
    mockSharedPrefDatasource = MockSharedPrefDatasource();
    userRepository =
        UserRepositoryImpl(userLocalDataSource: mockSharedPrefDatasource);
  });

  group('UserRepositoryImpl', () {
    const String userId = '1';
    const String userName = 'John Doe';
    const String userEmail = 'john.doe@example.com';

    const UserEntity userEntity =
        UserEntity(id: userId, name: userName, email: userEmail);

    test('getUserInLocalStorage - should return user from datasource',
        () async {
      // Arrange
      when(() => mockSharedPrefDatasource.read(any()))
          .thenAnswer((_) async => userEntity);

      // Act
      final result = await userRepository.getUserInLocalStorage();

      // Assert
      expect(result, equals(const Right(userEntity)));
      verify(() => mockSharedPrefDatasource.read("user")).called(1);
    });

    test(
        'getUserInLocalStorage - should return SharedPrefFailure if an error occurs',
        () async {
      // Arrange
      when(() => mockSharedPrefDatasource.read('user'))
          .thenThrow(Exception('Error reading user'));

      // Act
      final result = await userRepository.getUserInLocalStorage();

      // Assert
      expect(result.fold((l) => l, (r) => null),
          const SharedPrefFailure(message: 'Error reading user'));
      verify(() => mockSharedPrefDatasource.read("user")).called(1);
    });
  });
}
