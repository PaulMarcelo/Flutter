import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/constant/str_app.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasusuarioapp/src/pages/setting_page.dart';
import 'package:preferenciasusuarioapp/src/share_pref/preferencia_usuario.dart';

class MenuWidget extends StatelessWidget {
  final pref = PreferenciaUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //para iniciar la imgen desde el tope
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/menu-img.jpg'))),
          ),
          ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text(StrApp.homePage),
              onTap: () {
                pref.ultimaPagina = HomePage.routeName;
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              }),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text(StrApp.settingPage),
            onTap: () {
              pref.ultimaPagina = SettingPage.routeName;
              Navigator.pushReplacementNamed(
                  context,
                  SettingPage
                      .routeName); // navega a la siguiente pagina, tomando como raiz esta nueva pagina
            },
          ),
        ],
      ),
    );
  }
}
//--- navigator menu
//onTap: (){
//Navigator.pop(ctx);   // Cierra el menu lateral despues de navegar
//Navigator.pushNamed(ctx, SettingPage.routeName); // navega a la siguiente pagina
//},
