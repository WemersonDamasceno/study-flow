import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_flow/core/database_helper/database_helper.dart';
import 'package:study_flow/core/errors/exceptions.dart';
import 'package:study_flow/data/models/pomodoro/pomodoro_model.dart';

abstract class PomodoroDatasource {
  Future<List<PomodoroModel>> getAllPomodoros(String idUser);
  Future<bool> savePomodoro(PomodoroModel pomodoro);
  Future<bool> deletePomodoro({
    required String userId,
    required String pomodoroId,
  });
}

@Injectable(as: PomodoroDatasource)
class PomodoroDatasourceImpl implements PomodoroDatasource {
  final DatabaseHelper _databaseHelper;
  final resultFailure = 0;

  PomodoroDatasourceImpl({
    required DatabaseHelper databaseHelper,
  }) : _databaseHelper = databaseHelper;

  @override
  Future<bool> savePomodoro(PomodoroModel pomodoro) async {
    try {
      final Database database = await _databaseHelper.instance;
      final hasSaved = await database.insert(
        'pomodoro',
        pomodoro.toJson(),
      );

      if (hasSaved == resultFailure) {
        throw const LocalStorageException(
          message: "Error to create pomodoro",
        );
      }

      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PomodoroModel>> getAllPomodoros(String idUser) async {
    try {
      final Database database = await _databaseHelper.instance;
      final List<Map<String, dynamic>> pomodoros = await database.query(
        'pomodoro',
        where: "user_id = ?",
        whereArgs: [idUser],
      );

      return pomodoros
          .map((pomodoro) => PomodoroModel.fromJson(pomodoro))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deletePomodoro(
      {required String userId, required String pomodoroId}) async {
    try {
      final Database database = _databaseHelper.instance as Database;
      final hasDeleted = await database.delete(
        'pomodoro',
        where: "user_id = ? AND id = ?",
        whereArgs: [userId, pomodoroId],
      );

      if (hasDeleted == resultFailure) {
        throw const LocalStorageException(
          message: "Error to create pomodoro",
        );
      }

      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }
}
