import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/constant/constants.dart';
import 'package:preferenciasusuarioapp/src/share_pref/preferencia_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _secundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final pref = PreferenciaUsuario();

  @override
  void initState() {
    super.initState();
    this._genero = this.pref.genero;
    this._secundario = this.pref.colorSecundario;
    this._nombre = this.pref.nombre;
    _textController = TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: pref.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secundario,
            title: Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                this._secundario = value;
                this.pref.colorSecundario = this._secundario;
              });
            },
          ),
          RadioListTile(
            value: Constants.MASCULINO,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelecedRadio, //no se necesita pasar ningun argumento
            // a _setSelecedRadio por que automaticamente pasa el artumento de onchaged
          ),
          RadioListTile(
            value: Constants.FEMENINO,
            title: Text('Femenino'),
            groupValue: this._genero,
            onChanged: _setSelecedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'nombre',
                  helperText: 'Nombre de la persona usando el telefono'),
              onChanged: (stringValue) {
                this._nombre = stringValue;
                pref.nombre = this._nombre;
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSelecedRadio(int value) async {
    _genero = value;
    pref.genero = _genero;
    setState(() {});
  }
}
