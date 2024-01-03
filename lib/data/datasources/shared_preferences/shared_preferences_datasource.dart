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
  final SharedPreferences _sharedPreferences;

  SharedPrefDatasourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<String?> getToken(SharedPrefKeysEnum key) async {
    try {
      String? token = _sharedPreferences.getString(key.toString());
      return token;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveToken(SharedPrefKeysEnum key, value) async {
    try {
      bool hasSaved = await _sharedPreferences.setString(key.toString(), value);
      return hasSaved;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeToken(SharedPrefKeysEnum key) async {
    try {
      bool hasRemoved = await _sharedPreferences.remove(key.toString());
      return hasRemoved;
    } catch (e) {
      rethrow;
    }
  }
}
