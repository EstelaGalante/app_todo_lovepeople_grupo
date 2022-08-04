import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  final keyvalue = 'Chave-Valor';

  Future<void> salveLogin(LoginUser login) async {
    final resp = await SharedPreferences.getInstance();

    resp.setString(keyvalue, jsonEncode(login.toJson()));
  }

  Future<LoginUser?> getLogin() async {
    final resp = await SharedPreferences.getInstance();
    final cache = resp.getString(keyvalue);

    if (cache != null && cache.isNotEmpty) {
      return LoginUser.fromJson(jsonDecode(cache));
    }
    return null;
  }
}

class LoginUser {}
