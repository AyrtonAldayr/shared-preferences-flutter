import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_drawer.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // bool? _colorSecundario;
  int? _genero;
  // String _nombre = 'Usuario';

  late TextEditingController _textEditingController;
  final preferen = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    preferen.setUltimaPagina = SettingsPage.routeName;
    _genero = preferen.getGenero;
    // _colorSecundario = preferen.getColorSecundario;
    _textEditingController =
        new TextEditingController(text: preferen.getNombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor:
            (preferen.getColorSecundario) ? Colors.greenAccent : Colors.blue,
      ),
      drawer: MenuDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: preferen.getColorSecundario,
            title: Text('Color secundario:'),
            onChanged: (bool value) {
              setState(() {
                preferen.setColorSecundario = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Masculino'),
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            title: Text('Femenino'),
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: 'Nombre', helperText: 'Nombre de la persona'),
              onChanged: (String value) {
                preferen.setNombreUsuario = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int? valor) {
    setState(() {
      print('valor : $valor');
      preferen.setGenero = valor!;
      _genero = valor;
    });
  }
}
