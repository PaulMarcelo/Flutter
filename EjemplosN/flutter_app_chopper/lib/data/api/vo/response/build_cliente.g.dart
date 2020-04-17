// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_cliente.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildCliente> _$buildClienteSerializer =
    new _$BuildClienteSerializer();

class _$BuildClienteSerializer implements StructuredSerializer<BuildCliente> {
  @override
  final Iterable<Type> types = const [BuildCliente, _$BuildCliente];
  @override
  final String wireName = 'BuildCliente';

  @override
  Iterable<Object> serialize(Serializers serializers, BuildCliente object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.codcli != null) {
      result
        ..add('codcli')
        ..add(serializers.serialize(object.codcli,
            specifiedType: const FullType(String)));
    }
    if (object.nombrecli != null) {
      result
        ..add('nombrecli')
        ..add(serializers.serialize(object.nombrecli,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BuildCliente deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuildClienteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'codcli':
          result.codcli = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nombrecli':
          result.nombrecli = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuildCliente extends BuildCliente {
  @override
  final String codcli;
  @override
  final String nombrecli;

  factory _$BuildCliente([void Function(BuildClienteBuilder) updates]) =>
      (new BuildClienteBuilder()..update(updates)).build();

  _$BuildCliente._({this.codcli, this.nombrecli}) : super._();

  @override
  BuildCliente rebuild(void Function(BuildClienteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildClienteBuilder toBuilder() => new BuildClienteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildCliente &&
        codcli == other.codcli &&
        nombrecli == other.nombrecli;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, codcli.hashCode), nombrecli.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuildCliente')
          ..add('codcli', codcli)
          ..add('nombrecli', nombrecli))
        .toString();
  }
}

class BuildClienteBuilder
    implements Builder<BuildCliente, BuildClienteBuilder> {
  _$BuildCliente _$v;

  String _codcli;
  String get codcli => _$this._codcli;
  set codcli(String codcli) => _$this._codcli = codcli;

  String _nombrecli;
  String get nombrecli => _$this._nombrecli;
  set nombrecli(String nombrecli) => _$this._nombrecli = nombrecli;

  BuildClienteBuilder();

  BuildClienteBuilder get _$this {
    if (_$v != null) {
      _codcli = _$v.codcli;
      _nombrecli = _$v.nombrecli;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildCliente other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuildCliente;
  }

  @override
  void update(void Function(BuildClienteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuildCliente build() {
    final _$result =
        _$v ?? new _$BuildCliente._(codcli: codcli, nombrecli: nombrecli);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
