// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_profesor.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltProfesor> _$builtProfesorSerializer =
    new _$BuiltProfesorSerializer();

class _$BuiltProfesorSerializer implements StructuredSerializer<BuiltProfesor> {
  @override
  final Iterable<Type> types = const [BuiltProfesor, _$BuiltProfesor];
  @override
  final String wireName = 'BuiltProfesor';

  @override
  Iterable<Object> serialize(Serializers serializers, BuiltProfesor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'nombre',
      serializers.serialize(object.nombre,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'createAt',
      serializers.serialize(object.createAt,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BuiltProfesor deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltProfesorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createAt':
          result.createAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltProfesor extends BuiltProfesor {
  @override
  final int id;
  @override
  final String nombre;
  @override
  final String email;
  @override
  final String createAt;

  factory _$BuiltProfesor([void Function(BuiltProfesorBuilder) updates]) =>
      (new BuiltProfesorBuilder()..update(updates)).build();

  _$BuiltProfesor._({this.id, this.nombre, this.email, this.createAt})
      : super._() {
    if (nombre == null) {
      throw new BuiltValueNullFieldError('BuiltProfesor', 'nombre');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('BuiltProfesor', 'email');
    }
    if (createAt == null) {
      throw new BuiltValueNullFieldError('BuiltProfesor', 'createAt');
    }
  }

  @override
  BuiltProfesor rebuild(void Function(BuiltProfesorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltProfesorBuilder toBuilder() => new BuiltProfesorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltProfesor &&
        id == other.id &&
        nombre == other.nombre &&
        email == other.email &&
        createAt == other.createAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), nombre.hashCode), email.hashCode),
        createAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltProfesor')
          ..add('id', id)
          ..add('nombre', nombre)
          ..add('email', email)
          ..add('createAt', createAt))
        .toString();
  }
}

class BuiltProfesorBuilder
    implements Builder<BuiltProfesor, BuiltProfesorBuilder> {
  _$BuiltProfesor _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nombre;
  String get nombre => _$this._nombre;
  set nombre(String nombre) => _$this._nombre = nombre;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _createAt;
  String get createAt => _$this._createAt;
  set createAt(String createAt) => _$this._createAt = createAt;

  BuiltProfesorBuilder();

  BuiltProfesorBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _nombre = _$v.nombre;
      _email = _$v.email;
      _createAt = _$v.createAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltProfesor other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltProfesor;
  }

  @override
  void update(void Function(BuiltProfesorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltProfesor build() {
    final _$result = _$v ??
        new _$BuiltProfesor._(
            id: id, nombre: nombre, email: email, createAt: createAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
