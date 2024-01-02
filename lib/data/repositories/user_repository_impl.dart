import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final SharedPrefDatasource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<Either<Failure, UserEntity?>> getUserInLocalStorage() async {
    try {
      final UserEntity? user = await userLocalDataSource.read("user");
      return Future.value(Right(user));
    } on Exception {
      return const Left(SharedPrefFailure(message: 'Error reading user'));
    }
  }

  @override
  Future<Either<Failure, void>> removeUserInLocalStorage() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveUserInLocalStorage(UserEntity user) {
    throw UnimplementedError();
  }
}
