import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/constant/str_app.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasusuarioapp/src/pages/setting_page.dart';
import 'package:preferenciasusuarioapp/src/share_pref/preferencia_usuario.dart';

void main() async {
  // Se cargan las preferencias antes de que la aplicacion se muestre.
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciaUsuario();
  await prefs.initPrefs();

  // corre la aplicación
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciaUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StrApp.nameApp,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingPage.routeName: (BuildContext context) => SettingPage(),
      },
    );
  }
}
