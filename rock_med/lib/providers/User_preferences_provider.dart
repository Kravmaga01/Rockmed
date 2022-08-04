import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:rock_med/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'User';
  static ModelUser myUser = ModelUser(
      coverImagePath: myUser.coverImagePath,
      imagePath: myUser.imagePath,
      name: myUser.name,
      email: '',
      about: myUser.about,
      isDarkmode: myUser.isDarkmode,
      role: '');

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(ModelUser user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static ModelUser getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : ModelUser.fromJson((jsonDecode(json)));
  }
}
