import 'package:firebase_auth/firebase_auth.dart';
import 'package:rock_med/models/model_user.dart' show UserPrefrence;

class UserPreferences {
  static UserPrefrence myUser = UserPrefrence(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSowTP0SBYzj5tuN3mFfspHeeLPuaDGSy4E-W4IzEqfZw&s',
      'https://brandstrat.co/wp-content/uploads/2022/01/blank-profile-picture-gd2f1d32bd_1280.png',
      'name',
      '',
      'Hola!!! aqui podras contranos mas sobre ti y tus gustos');
}
