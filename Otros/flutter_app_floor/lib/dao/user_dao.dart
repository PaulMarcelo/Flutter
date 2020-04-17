import 'package:floor/floor.dart';
import 'package:flutter_app_floor/model/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<User>> findAllUser();

  @Query('SELECT * FROM user WHERE id = :id')
  Future<User> findUserById(int id);

  @insert
  Future<void> insertUser(User person);


}