import 'package:firebase_auth/firebase_auth.dart';
import 'package:rock_med/models/model_user.dart';

class UserPreferences {
  static ModelUser myUser = ModelUser(
      coverImagPath: myUser.coverImagPath,
      imagePath: myUser.imagePath,
      name: myUser.name,
      email: '',
      about: myUser.about,
      isDark: myUser.isDark);
}
