//ignore: unused_import
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<bool> saveQuoteId(String value) async {
    List<String> favQoutes = getFavQoutes();
    if (favQoutes.contains(value)) {
      return false;
    }
    favQoutes.add(value);
    return await _sharedPreferences!
        .setStringList('favQoutes', favQoutes.toList());
  }

  List<String> getFavQoutes() {
    try {
      return _sharedPreferences!.getStringList('favQoutes')!;
    } catch (e) {
      return [];
    }
  }

  Future<bool> removeQuoteId(String value) async {
    List<String> favQoutes = getFavQoutes();
    favQoutes.remove(value);
    return await _sharedPreferences!.setStringList('favQoutes', favQoutes);
  }
}
