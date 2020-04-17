import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_foto_localizacion/ui/foto_page.dart';
import 'package:flutter_app_foto_localizacion/ui/home_page.dart';

import 'persistencia/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
  await $FloorAppDatabase.databaseBuilder("fotos.db").build();
  MyApp.dataBase = database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static String pathFolder = '';
  static AppDatabase dataBase;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'foto': (BuildContext context) => FotoPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}
