import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_flow/data/models/user/user_model.dart';

abstract class SharedPrefDatasource {
  Future read(String key);
  Future<void> save(String key, value);
  Future<void> remove(String key);
}

@Injectable(as: SharedPrefDatasource)
class SharedPrefDatasourceImpl implements SharedPrefDatasource {
  final SharedPreferencesImpl _sharedPreferencesImpl;

  SharedPrefDatasourceImpl({
    required SharedPreferencesImpl sharedPreferencesImpl,
  }) : _sharedPreferencesImpl = sharedPreferencesImpl;

  @override
  Future read(String key) async {
    try {
      String? valueJson;
      await _sharedPreferencesImpl.instance.then((value) {
        valueJson = value.getString(key);
      });

      if (valueJson == null) return null;
      final userMap = jsonDecode(valueJson!);
      final userModel = UserModel.fromJson(userMap);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

@injectable
class SharedPreferencesImpl {
  Future<SharedPreferences> get instance async =>
      await SharedPreferences.getInstance();
}
