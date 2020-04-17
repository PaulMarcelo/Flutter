import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


import 'dao/person_dao.dart';
import 'dao/user_dao.dart';
import 'model/person.dart';
import 'model/user.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person, User])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
  UserDao get userDao;
}