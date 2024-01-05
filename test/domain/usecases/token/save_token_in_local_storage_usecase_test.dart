import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';
import 'package:study_flow/domain/usecases/token/save_token_in_local_storage_usecase.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late SaveTokenInLocalStorageUsecase usecase;
  late MockUserRepository mockUserRepository;

  const token = "A3X-42G-M1NDTR1X-789";

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = SaveTokenInLocalStorageUsecase(
      userRepository: mockUserRepository,
    );
  });

  group('GetUserInLocalStorageUsecase', () {
    test('should get user from repository', () async {
      // Arrange
      when(() => mockUserRepository.saveToken(token))
          .thenAnswer((_) async => const Right(true));

      // Act
      final result = await usecase(const SaveTokenInLocalStorageParams(
        token: token,
      ));

      // Assert
      expect(result, equals(const Right(true)));
      verify(() => mockUserRepository.saveToken(token)).called(1);
    });

    test('should return a failure if repository call fails', () async {
      // Arrange
      when(() => mockUserRepository.saveToken(token)).thenAnswer(
          (_) async => const Left(SharedPrefFailure(message: 'Error')));

      // Act
      final result = await usecase(const SaveTokenInLocalStorageParams(
        token: token,
      ));

      // Assert
      expect(result, equals(const Left(SharedPrefFailure(message: 'Error'))));
      verify(() => mockUserRepository.saveToken(token)).called(1);
    });
  });
}
