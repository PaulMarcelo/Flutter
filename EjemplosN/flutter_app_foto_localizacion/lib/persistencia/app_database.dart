import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_app_foto_localizacion/persistencia/dao/producto_dao.dart';
import 'package:flutter_app_foto_localizacion/persistencia/modelo/producto.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Producto])
abstract class AppDatabase extends FloorDatabase {

  ProductoDao get productoDao;

}
