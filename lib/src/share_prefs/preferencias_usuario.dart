import 'package:preferencias_usuario_app/src/pages/home_page.dart';
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

  //Getter y Setter del genero
  int get getGenero {
    return this._prefs?.getInt('genero') ?? 1;
  }

  set setGenero(int value) {
    this._prefs?.setInt('genero', value);
  }

  //Getter y Setter del ColorSecundario
  bool get getColorSecundario {
    return this._prefs?.getBool('colorSecundario') ?? true;
  }

  set setColorSecundario(bool value) {
    this._prefs?.setBool('colorSecundario', value);
  }

  //Getter y Setter del Nombre del Usuario
  String get getNombreUsuario {
    return this._prefs?.getString('nombreUsuario') ?? '';
  }

  set setNombreUsuario(String value) {
    this._prefs?.setString('nombreUsuario', value);
  }

  //Getter y Setter de la ultima pagina
  String get getUltimaPagina {
    return this._prefs?.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set setUltimaPagina(String value) {
    this._prefs?.setString('ultimaPagina', value);
  }
}
