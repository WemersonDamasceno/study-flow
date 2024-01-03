import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final SharedPrefDatasource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final String? user = await userLocalDataSource.getToken(
        SharedPrefKeysEnum.token,
      );
      return Future.value(Right(user));
    } on Exception {
      return const Left(SharedPrefFailure(message: 'Error reading token.'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeToken() async {
    try {
      await userLocalDataSource.removeToken(
        SharedPrefKeysEnum.token,
      );
      return Future.value(const Right(true));
    } catch (e) {
      return const Left(SharedPrefFailure(message: 'Error removing token.'));
    }
  }

  @override
  Future<Either<Failure, bool>> saveToken(String token) async {
    try {
      await userLocalDataSource.saveToken(
        SharedPrefKeysEnum.token,
        token,
      );
      return Future.value(const Right(true));
    } catch (e) {
      return const Left(SharedPrefFailure(message: 'Error saving token.'));
    }
  }
}
