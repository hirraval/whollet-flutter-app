import 'dart:convert';

import 'package:data/src/model/model.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences _preference;

  AppPreference(this._preference);

  Future<bool> clear() {
    var languageCode = currentLanguageCode;
    return _preference.clear().whenComplete(() {
      currentLanguageCode = languageCode;
    });
  }

  bool get isLogin => accessToken != null && ajaxAccessToken != null;

  TokenData? get accessToken => _getData("access_token", TokenData.fromJson);

  set accessToken(TokenData? value) => _setData("access_token", value?.toJson());

  TokenData? get ajaxAccessToken => _getData("ajax_access_token", TokenData.fromJson);

  set ajaxAccessToken(TokenData? value) => _setData("ajax_access_token", value?.toJson());

  NestServiceCredentials? get nestServiceToken => _getData("nest_service_token", NestServiceCredentials.fromJson);

  set nestServiceToken(NestServiceCredentials? value) => _setData("nest_service_token", value?.toJson());

  String? get ajaxUserId => _preference.getString("ajax_user_id");

  set ajaxUserId(String? value) {
    if (value == null) {
      _preference.remove("ajax_user_id");
      return;
    }
    _preference.setString("ajax_user_id", value);
  }

  String? get userId => _preference.getString("user_id");

  set userId(String? value) {
    if (value == null) {
      _preference.remove("user_id");
      return;
    }
    _preference.setString("user_id", value);
  }

  User? get user => _getData<User>("user", User.fromJson);

  set user(User? user) => _setData("user", user?.toJson());

  String? get currentLanguageCode => _preference.getString("language_code");

  set currentLanguageCode(String? value) =>
      value == null ? _preference.remove("language_code") : _preference.setString("language_code", value);

  _setData(String key, Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) {
      _preference.remove(key);
      return;
    }
    _preference.setString(key, jsonEncode(json));
  }

  T? _getData<T extends Object>(String key, T Function(Map<String, dynamic> json) parser) {
    if (_preference.containsKey(key)) {
      var value = _preference.get(key);
      if (value is String && value.isNotEmpty) {
        return parser(jsonDecode(value));
      }
    }
    return null;
  }
}
