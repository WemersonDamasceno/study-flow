import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';
import 'package:study_flow/domain/usecases/user/save_user_usecase.dart';
import 'package:test/test.dart';

import '../../../mocks/user_mock.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late SaveUserUsecase saveUserUsecase;
  late MockUserRepository mockUserRepository;

  final user = UserMock.entity;

  setUp(() {
    mockUserRepository = MockUserRepository();
    saveUserUsecase = SaveUserUsecase(userRepository: mockUserRepository);
  });

  test('should save user and return user entity', () async {
    // Arrange
    final saveUserParams = SaveUserParams(user: user);
    when(() => mockUserRepository.saveUser(user)).thenAnswer(
      (_) async => Right(user),
    );

    // Act
    final result = await saveUserUsecase(saveUserParams);

    // Assert
    expect(result, Right(user));
    verify(() => mockUserRepository.saveUser(user)).called(1);
  });

  test('should return a failure when saving user fails', () async {
    // Arrange
    final saveUserParams = SaveUserParams(user: user);

    when(() => mockUserRepository.saveUser(user)).thenAnswer(
      (_) async => const Left(SqliteFailure(message: 'Error saving user.')),
    );

    // Act
    final result = await saveUserUsecase(saveUserParams);

    // Assert
    expect(result, const Left(SqliteFailure(message: 'Error saving user.')));
    verify(() => mockUserRepository.saveUser(user)).called(1);
  });
}
