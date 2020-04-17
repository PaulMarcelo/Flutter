import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_profesor.g.dart';

abstract class BuiltProfesor implements Built<BuiltProfesor, BuiltProfesorBuilder> {
  @nullable
  int get id;

  String get nombre;
  String get email;
  String get createAt;

  BuiltProfesor._();

  factory BuiltProfesor([updates(BuiltProfesorBuilder b)]) = _$BuiltProfesor;

  static Serializer<BuiltProfesor> get serializer => _$builtProfesorSerializer;
}
