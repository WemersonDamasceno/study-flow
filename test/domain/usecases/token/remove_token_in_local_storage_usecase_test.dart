import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';
import 'package:study_flow/domain/usecases/token/remove_token_in_local_storage_usecase.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late RemoveTokenInLocalStorageUsecase usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase =
        RemoveTokenInLocalStorageUsecase(userRepository: mockUserRepository);
  });

  group('GetUserInLocalStorageUsecase', () {
    test('should get user from repository', () async {
      // Arrange
      when(() => mockUserRepository.removeToken())
          .thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, equals(const Right(true)));
      verify(() => mockUserRepository.removeToken()).called(1);
    });

    test('should return a failure if repository call fails', () async {
      // Arrange
      when(() => mockUserRepository.removeToken()).thenAnswer(
          (_) async => const Left(SharedPrefFailure(message: 'Error')));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, equals(const Left(SharedPrefFailure(message: 'Error'))));
      verify(() => mockUserRepository.removeToken()).called(1);
    });
  });
}
