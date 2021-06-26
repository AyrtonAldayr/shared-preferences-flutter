import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final preferen = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    preferen.setUltimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor:
            (preferen.getColorSecundario) ? Colors.greenAccent : Colors.blue,
      ),
      drawer: MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario : ${preferen.getColorSecundario}'),
          Divider(),
          Text('Genero: ${preferen.getGenero}'),
          Divider(),
          Text('Nombre usuario: ${preferen.getNombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
