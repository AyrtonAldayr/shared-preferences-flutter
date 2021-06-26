import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int? _genero = 1;
  String _nombre = 'Usuario';

  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
            value: _colorSecundario,
            title: Text('Color secundario:'),
            onChanged: (bool value) {
              setState(() {
                _colorSecundario = value;
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
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('genero', valor!);
    setState(() {
      print('valor : $valor');
      _genero = valor;
    });
  }
}
