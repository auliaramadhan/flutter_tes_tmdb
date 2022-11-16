import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_starter_private/model/login_data.dart';
import 'package:flutter_starter_private/utils/constant.dart';

class StorageHelper {
  StorageHelper._();

  static final instance = StorageHelper._();

  final _storage = const FlutterSecureStorage();
  Future<String?> read(StorageKey key) async {
    String? val = await _storage.read(key: key.name);
    return val;
  }

  Future<UserData?> readLoginData() async {
    String? val = await _storage.read(key: StorageKey.loginData.name);
    if (val == null) return null;
    final jsonLoginData = json.decode(val);
    UserData user = UserData.fromJson(jsonLoginData);
    return user;
  }

  Future<void> saveLoginData(UserData dataString) async {
    _storage.write(key: StorageKey.loginData.name, value: jsonEncode(dataString.toJson()));
    // await Future.delayed(const Duration(microseconds: 500));
  }

  Future<void> write({required StorageKey key, required String value}) async {
    _storage.write(key: key.name, value: value);
  }

  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _storage.containsKey(key: key);
    return containsKey;
  }

  Future<void> deleteAll() async {
    _storage.deleteAll();
  }

  Future<void> delete(StorageKey key) async {
    _storage.delete(key: key.name);
  }

  Future<void> deleteLoginData() async {
    _storage.delete(key: "mywifi_user_data");
  }
}
