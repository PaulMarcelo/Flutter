// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_pageable.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildPageable> _$buildPageableSerializer =
    new _$BuildPageableSerializer();

class _$BuildPageableSerializer implements StructuredSerializer<BuildPageable> {
  @override
  final Iterable<Type> types = const [BuildPageable, _$BuildPageable];
  @override
  final String wireName = 'BuildPageable';

  @override
  Iterable<Object> serialize(Serializers serializers, BuildPageable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.sort != null) {
      result
        ..add('sort')
        ..add(serializers.serialize(object.sort,
            specifiedType: const FullType(BuildSort)));
    }
    if (object.offset != null) {
      result
        ..add('offset')
        ..add(serializers.serialize(object.offset,
            specifiedType: const FullType(int)));
    }
    if (object.pageSize != null) {
      result
        ..add('pageSize')
        ..add(serializers.serialize(object.pageSize,
            specifiedType: const FullType(int)));
    }
    if (object.pageNumber != null) {
      result
        ..add('pageNumber')
        ..add(serializers.serialize(object.pageNumber,
            specifiedType: const FullType(int)));
    }
    if (object.paged != null) {
      result
        ..add('paged')
        ..add(serializers.serialize(object.paged,
            specifiedType: const FullType(bool)));
    }
    if (object.unpaged != null) {
      result
        ..add('unpaged')
        ..add(serializers.serialize(object.unpaged,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  BuildPageable deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuildPageableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'sort':
          result.sort.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuildSort)) as BuildSort);
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pageSize':
          result.pageSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pageNumber':
          result.pageNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'paged':
          result.paged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'unpaged':
          result.unpaged = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$BuildPageable extends BuildPageable {
  @override
  final BuildSort sort;
  @override
  final int offset;
  @override
  final int pageSize;
  @override
  final int pageNumber;
  @override
  final bool paged;
  @override
  final bool unpaged;

  factory _$BuildPageable([void Function(BuildPageableBuilder) updates]) =>
      (new BuildPageableBuilder()..update(updates)).build();

  _$BuildPageable._(
      {this.sort,
      this.offset,
      this.pageSize,
      this.pageNumber,
      this.paged,
      this.unpaged})
      : super._();

  @override
  BuildPageable rebuild(void Function(BuildPageableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildPageableBuilder toBuilder() => new BuildPageableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildPageable &&
        sort == other.sort &&
        offset == other.offset &&
        pageSize == other.pageSize &&
        pageNumber == other.pageNumber &&
        paged == other.paged &&
        unpaged == other.unpaged;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, sort.hashCode), offset.hashCode),
                    pageSize.hashCode),
                pageNumber.hashCode),
            paged.hashCode),
        unpaged.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuildPageable')
          ..add('sort', sort)
          ..add('offset', offset)
          ..add('pageSize', pageSize)
          ..add('pageNumber', pageNumber)
          ..add('paged', paged)
          ..add('unpaged', unpaged))
        .toString();
  }
}

class BuildPageableBuilder
    implements Builder<BuildPageable, BuildPageableBuilder> {
  _$BuildPageable _$v;

  BuildSortBuilder _sort;
  BuildSortBuilder get sort => _$this._sort ??= new BuildSortBuilder();
  set sort(BuildSortBuilder sort) => _$this._sort = sort;

  int _offset;
  int get offset => _$this._offset;
  set offset(int offset) => _$this._offset = offset;

  int _pageSize;
  int get pageSize => _$this._pageSize;
  set pageSize(int pageSize) => _$this._pageSize = pageSize;

  int _pageNumber;
  int get pageNumber => _$this._pageNumber;
  set pageNumber(int pageNumber) => _$this._pageNumber = pageNumber;

  bool _paged;
  bool get paged => _$this._paged;
  set paged(bool paged) => _$this._paged = paged;

  bool _unpaged;
  bool get unpaged => _$this._unpaged;
  set unpaged(bool unpaged) => _$this._unpaged = unpaged;

  BuildPageableBuilder();

  BuildPageableBuilder get _$this {
    if (_$v != null) {
      _sort = _$v.sort?.toBuilder();
      _offset = _$v.offset;
      _pageSize = _$v.pageSize;
      _pageNumber = _$v.pageNumber;
      _paged = _$v.paged;
      _unpaged = _$v.unpaged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildPageable other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuildPageable;
  }

  @override
  void update(void Function(BuildPageableBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuildPageable build() {
    _$BuildPageable _$result;
    try {
      _$result = _$v ??
          new _$BuildPageable._(
              sort: _sort?.build(),
              offset: offset,
              pageSize: pageSize,
              pageNumber: pageNumber,
              paged: paged,
              unpaged: unpaged);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sort';
        _sort?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuildPageable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
