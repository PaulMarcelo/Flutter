import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario',
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext ctx) => LoginPage(),
        HomePage.routeName: (BuildContext ctx) => HomePage()
      },
    );
  }
}
