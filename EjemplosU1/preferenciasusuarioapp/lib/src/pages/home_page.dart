import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/constant/constants.dart';
import 'package:preferenciasusuarioapp/src/share_pref/preferencia_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciaUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${getGenero()}'),
          Divider(),
          Text('Nombre de Usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }

  String getGenero() {
    if (prefs.genero == Constants.MASCULINO)
      return Constants.MASCULINO_STR;
    else
      return Constants.FEMENINO_STR;
  }
}
