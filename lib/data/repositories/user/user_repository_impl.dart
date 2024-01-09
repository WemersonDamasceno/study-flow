import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/data/datasources/local_storage/user_datasource.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';
import 'package:study_flow/data/models/user/user_model.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final SharedPrefDatasource _sharedPreferencesDataSource;
  final SqliteDataSource _sqliteDataSource;

  UserRepositoryImpl({
    required SqliteDataSource sqliteDataSource,
    required SharedPrefDatasource sharedPreferencesDataSource,
  })  : _sharedPreferencesDataSource = sharedPreferencesDataSource,
        _sqliteDataSource = sqliteDataSource;

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final String? user = await _sharedPreferencesDataSource.getToken(
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
      await _sharedPreferencesDataSource.removeToken(
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
      await _sharedPreferencesDataSource.saveToken(
        SharedPrefKeysEnum.token,
        token,
      );
      return Future.value(const Right(true));
    } catch (e) {
      return const Left(SharedPrefFailure(message: 'Error saving token.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String id) async {
    try {
      final user = await _sqliteDataSource.getUserById(idUser: id);
      return Future.value(Right(user));
    } catch (e) {
      return const Left(SqliteFailure(message: 'Error getting user.'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeUser(String id) async {
    try {
      final userDeleted = await _sqliteDataSource.deleteUser(idUser: id);
      return Future.value(Right(userDeleted));
    } catch (e) {
      return const Left(SqliteFailure(message: 'Error removing user.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> saveUser(UserEntity user) async {
    try {
      final userSaved = await _sqliteDataSource.createUser(
        user: UserModel.fromEntity(user),
      );
      return Future.value(Right(userSaved));
    } catch (e) {
      return const Left(SqliteFailure(message: 'Error saving user.'));
    }
  }
}
