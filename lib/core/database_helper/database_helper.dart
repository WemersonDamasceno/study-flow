import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final Database instance = DatabaseHelper().configDatabase();

  configDatabase() async {
    const databaseName = 'studyflow_database.db';
    final databaseIsExists = await databaseExists(
      join(await getDatabasesPath(), databaseName),
    );

    if (databaseIsExists) {
      return;
    }

    //Open database
    final database = await _initDatabase(databaseName);

    //Create tables
    await _createTables(database);

    return database;
  }

  Future<Database> _initDatabase(databaseName) async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
    );
  }

  _createTables(Database db) async {
    final String scriptCreate = await rootBundle.loadString(
      "assets/sql/create.sql",
    );

    final sqlCreate = scriptCreate.split(";");

    for (final sql in sqlCreate) {
      if (sql.trim().isNotEmpty) {
        await db.execute(sql);
      }
    }
  }
}
