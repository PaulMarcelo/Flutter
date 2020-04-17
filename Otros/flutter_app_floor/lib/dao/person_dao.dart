import 'package:floor/floor.dart';
import 'package:flutter_app_floor/model/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<Person> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);

  @transaction
  Future<void> replaceUsers(List<Person> users) async {
//    await deleteAllUsers();
//    await insertUsers(users);
  }
}