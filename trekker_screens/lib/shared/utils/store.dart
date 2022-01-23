import 'package:shared_preferences/shared_preferences.dart';

abstract class Store<T> {
  Future<T> read(String key);
  Future<void> save(String key, T value);
  Future<void> delete(String key);
}

class SharedPreferencesTokenStore implements Store<String> {
  @override
  Future<String> read(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getString(key);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> save(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (e) {
      rethrow;
    }
  }
}
