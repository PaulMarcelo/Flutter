import 'package:floor/floor.dart';

@Entity(tableName: 'person')
class Person {
  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: 'name', nullable: false)
  final String name;

  Person(this.name);
}