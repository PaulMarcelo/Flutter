//implementacion de patron singleton  para preferencias
import 'package:preferenciasusuarioapp/src/constant/constantPref.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciaUsuario {
  static final PreferenciaUsuario _instacia =
      new PreferenciaUsuario._internal();

  factory PreferenciaUsuario() {
    return _instacia;
  }

  PreferenciaUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero => _prefs.getInt(ConstantPref.generoKey) ?? 1;

  set genero(int value) => this._prefs.setInt(ConstantPref.generoKey, value);

  get nombre => this._prefs.getString(ConstantPref.nombreKey) ?? '';

  set nombre(String value) =>
      this._prefs.setString(ConstantPref.nombreKey, value);

  get colorSecundario =>
      this._prefs.getBool(ConstantPref.colorSecundarioKey) ?? false;

  set colorSecundario(bool value) =>
      this._prefs.setBool(ConstantPref.colorSecundarioKey, value);

  get ultimaPagina =>
      this._prefs.getString(ConstantPref.ultimaPaginaKey) ?? HomePage.routeName;

  set ultimaPagina(String value) =>
      this._prefs.setString(ConstantPref.ultimaPaginaKey, value);
}
