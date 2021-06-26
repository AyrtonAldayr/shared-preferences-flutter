import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  SharedPreferences? _prefs;

  iniciarPreferencias() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool? _colorSecudanrio;
  // int? _genero;
  // String? _nombre;

  //Getter y Setter del genero
  get getGenero {
    return this._prefs?.getInt('genero') ?? 1;
  }

  set setGenero(int value) {
    this._prefs?.setInt('genero', value);
  }
}
