import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';
import 'package:study_flow/domain/usecases/get_token_in_local_storage_usecase.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetTokenInLocalStorageUsecase usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetTokenInLocalStorageUsecase(userRepository: mockUserRepository);
  });

  const token = "A3X-42G-M1NDTR1X-789";

  group('GetUserInLocalStorageUsecase', () {
    test('should get user from repository', () async {
      // Arrange
      when(() => mockUserRepository.getToken())
          .thenAnswer((_) async => const Right(token));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, equals(const Right(token)));
      verify(() => mockUserRepository.getToken()).called(1);
    });

    test('should return a failure if repository call fails', () async {
      // Arrange
      when(() => mockUserRepository.getToken()).thenAnswer(
          (_) async => const Left(SharedPrefFailure(message: 'Error')));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, equals(const Left(SharedPrefFailure(message: 'Error'))));
      verify(() => mockUserRepository.getToken()).called(1);
    });
  });
}
