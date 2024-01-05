import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_flow/core/database_helper/database_helper.dart';
import 'package:study_flow/core/errors/exceptions.dart';
import 'package:study_flow/data/models/user/user_model.dart';

abstract class SqliteDataSource {
  Future<UserModel> createUser({required UserModel user});
  Future<UserModel> updateUser({required UserModel user});
  Future<bool> deleteUser({required String idUser});
  Future<UserModel> getUserById({required String idUser});
}

@Injectable(as: SqliteDataSource)
class SqliteDatasourceImpl implements SqliteDataSource {
  SqliteDatasourceImpl({
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  final DatabaseHelper _databaseHelper;

  @override
  Future<UserModel> createUser({
    required UserModel user,
  }) async {
    try {
      final Database database = await _databaseHelper.instance;
      final id = await database.insert(
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
      final Database database = await _databaseHelper.instance;
      final id = await database.update(
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
  Future<bool> deleteUser({required String idUser}) async {
    try {
      final Database database = await _databaseHelper.instance;
      final id = await database.delete(
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
      final Database database = await _databaseHelper.instance;
      final result = await database.query(
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
