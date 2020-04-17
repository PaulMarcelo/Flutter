import 'dart:async';
import 'package:floor/floor.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/cliente_dao.dart';
import 'model/cliente.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Cliente])
abstract class AppDatabase extends FloorDatabase {

  ClienteDao get clienteDao;

}
