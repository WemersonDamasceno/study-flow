import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';

abstract class SharedPrefDatasource {
  Future<String?> getToken(SharedPrefKeysEnum key);
  Future<bool> saveToken(SharedPrefKeysEnum key, value);
  Future<bool> removeToken(SharedPrefKeysEnum key);
}

@Injectable(as: SharedPrefDatasource)
class SharedPrefDatasourceImpl implements SharedPrefDatasource {
  final SharedPrefImpl _sharedPreferences;

  SharedPrefDatasourceImpl({required SharedPrefImpl sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<String?> getToken(SharedPrefKeysEnum key) async {
    try {
      final SharedPreferences sharedPreferences =
          await _sharedPreferences.instance;
      String? token = sharedPreferences.getString(key.toString());
      return token;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveToken(SharedPrefKeysEnum key, value) async {
    try {
      final SharedPreferences sharedPreferences =
          await _sharedPreferences.instance;
      bool hasSaved = await sharedPreferences.setString(key.toString(), value);
      return hasSaved;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeToken(SharedPrefKeysEnum key) async {
    try {
      final SharedPreferences sharedPreferences =
          await _sharedPreferences.instance;
      bool hasRemoved = await sharedPreferences.remove(key.toString());
      return hasRemoved;
    } catch (e) {
      rethrow;
    }
  }
}

@injectable
class SharedPrefImpl {
  Future<SharedPreferences> get instance async =>
      await SharedPreferences.getInstance();
}
