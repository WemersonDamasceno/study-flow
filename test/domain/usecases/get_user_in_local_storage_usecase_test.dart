import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';
import 'package:study_flow/domain/usecases/get_user_in_local_storage_usecase.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUserInLocalStorageUsecase usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetUserInLocalStorageUsecase(userRepository: mockUserRepository);
  });

  group('GetUserInLocalStorageUsecase', () {
    const String key = 'user';

    test('should get user from repository', () async {
      // Arrange
      const userEntity =
          UserEntity(id: '1', name: 'John Doe', email: 'john.doe@example.com');
      when(() => mockUserRepository.getUserInLocalStorage())
          .thenAnswer((_) async => const Right(userEntity));

      // Act
      final result = await usecase(const GetUserInLocalParams(key: key));

      // Assert
      expect(result, equals(const Right(userEntity)));
      verify(() => mockUserRepository.getUserInLocalStorage()).called(1);
    });

    test('should return a failure if repository call fails', () async {
      // Arrange
      when(() => mockUserRepository.getUserInLocalStorage()).thenAnswer(
          (_) async => const Left(SharedPrefFailure(message: 'Error')));

      // Act
      final result = await usecase(const GetUserInLocalParams(key: key));

      // Assert
      expect(result, equals(const Left(SharedPrefFailure(message: 'Error'))));
      verify(() => mockUserRepository.getUserInLocalStorage()).called(1);
    });
  });
}
