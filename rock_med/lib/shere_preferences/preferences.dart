import 'package:shared_preferences/shared_preferences.dart';

//Todo: Esta clase  contiene el get y el ser de las preferencias de usuario.
//* las preferencias de usuario se almacenaran de manre local  el  dispositivo.

//! Cuidado importante
class Preferences {
  // metodos estaticos
  static late SharedPreferences _prefs;
  static String _name = '';
  static bool _isDarkmode = true;
  static String _generoMusical = '';
  static String _edad = '';
  static String _direccion = '';

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
}
