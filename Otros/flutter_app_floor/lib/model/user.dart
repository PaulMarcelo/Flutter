import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class User {
  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: 'name', nullable: false)
  final String name;

  @ColumnInfo(name: 'edad', nullable: false)
  final int edad;


  User(this.name, this.edad);
}