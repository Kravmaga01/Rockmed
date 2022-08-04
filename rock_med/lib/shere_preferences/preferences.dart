import 'package:shared_preferences/shared_preferences.dart';

//Todo: Esta clase  contiene el get y el ser de las preferencias de usuario.
//* las preferencias de usuario se almacenaran de manre local  el  dispositivo.

//! Cuidado importante
class Preferences {
  // metodos estaticos
  static late SharedPreferences _prefs;
  static String _name = 'EDWARD';
  static bool _isDarkmode = true;
  static String _generoMusical = 'ROCK';
  static String _edad = '18';
  static String _direccion = 'MEDELLÍN';
  static String _about = 'SOY REPONSABLE Y UN GRAN TRABAJADOR';
  static String _role = 'ADMIN';
  static String _coverImagPath =
      'https://restorixhealth.com/wp-content/uploads/2018/08/No-Image.png';
  static String _imagePath =
      'https://brandstrat.co/wp-content/uploads/2022/01/blank-profile-picture-gd2f1d32bd_1280.png';

//*todo: inico del get.

//* inicialización de las preferencias
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//* get de Preference name
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

//* get de Preference theme
  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

//* get de Preference genero musical
  static String get generoMusical {
    return _prefs.getString('generoMusical') ?? _generoMusical;
  }

//* get de Preference edad
  static String get edad {
    return _prefs.getString('edad') ?? _edad;
  }

//* get de Preference direccion
  static String get direccion {
    return _prefs.getString('direccion') ?? _direccion;
  }

//* get de Preference role
  static String get role {
    return _prefs.getString('role') ?? _role;
  }

  //* get de Preference role
  static String get about {
    return _prefs.getString('about') ?? _about;
  }

  //* get de Preference coverImage
  static String get coverImagePath {
    return _prefs.getString('coverImage') ?? _coverImagPath;
  }

  //* get de Preference role
  static String get imagePath {
    return _prefs.getString('imagePath') ?? _imagePath;
  }

//Todo: inicio del set

//* set preference name
  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

//* set preference theme
  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }

//* set preference genero musical
  static set generoMusical(String genero) {
    _generoMusical = genero;
    _prefs.setString('generoMusical', genero);
  }

//* set preference edad
  static set edad(String value) {
    _edad = value;
    _prefs.setString('edad', value);
  }

//* set preference direccion
  static set direccion(String value) {
    _direccion = value;
    _prefs.setString('direccion', value);
  }

  //* set preference role
  static set role(String value) {
    _role = value;
    _prefs.setString('role', value);
  }

  //* set preference edad
  static set about(String value) {
    _about = value;
    _prefs.setString('about', value);
  }

//* set preference direccion
  static set coverImagePath(String value) {
    _coverImagPath = value;
    _prefs.setString(' coverImagePath', value);
  }

  //* set preference role
  static set imagePath(String value) {
    _imagePath = value;
    _prefs.setString(' ImagePath', value);
  }
}
