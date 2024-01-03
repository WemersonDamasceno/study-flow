import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_flow/core/errors/exceptions.dart';
import 'package:study_flow/data/models/user/user_model.dart';

abstract class SqliteDataSource {
  Future<UserModel> createUser({required UserModel user});

  Future<UserModel> updateUser({required UserModel user});

  Future<bool> deleteUser(String idUser);

  Future<UserModel> getUserById({required String idUser});
}

@Injectable(as: SqliteDataSource)
class SqliteDatasourceImpl implements SqliteDataSource {
  final Database _database;

  SqliteDatasourceImpl({
    required Database database,
  }) : _database = database;

  @override
  Future<UserModel> createUser({
    required UserModel user,
  }) async {
    try {
      final id = await _database.insert(
        'user',
        user.toJson(),
      );

      if (id == 0) {
        throw const LocalStorageException(
          message: "Error to create user",
        );
      }

      return Future.value(user.copy(id: id.toString()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> updateUser({
    required UserModel user,
  }) async {
    try {
      final id = await _database.update(
        'user',
        user.toJson(),
        where: "id = ?",
        whereArgs: [user.id],
      );

      if (id == 0) {
        throw const LocalStorageException(
          message: "Error to update user",
        );
      }

      return Future.value(user.copy(id: id.toString()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser(String idUser) async {
    try {
      final id = await _database.delete(
        'user',
        where: "id = ?",
        whereArgs: [idUser],
      );

      if (id == 0) {
        throw const LocalStorageException(
          message: "Error to delete user",
        );
      }

      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserById({required String idUser}) async {
    try {
      final result = await _database.query(
        'user',
        where: "id = ?",
        whereArgs: [idUser],
      );

      if (result.isEmpty) {
        throw const LocalStorageException(
          message: "Error to get user",
        );
      }

      final UserModel user = UserModel.fromJson(result.first);

      return Future.value(user);
    } catch (e) {
      rethrow;
    }
  }
}
