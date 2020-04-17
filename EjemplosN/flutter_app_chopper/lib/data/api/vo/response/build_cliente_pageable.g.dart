// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_cliente_pageable.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildClientePageable> _$buildClientePageableSerializer =
    new _$BuildClientePageableSerializer();

class _$BuildClientePageableSerializer
    implements StructuredSerializer<BuildClientePageable> {
  @override
  final Iterable<Type> types = const [
    BuildClientePageable,
    _$BuildClientePageable
  ];
  @override
  final String wireName = 'BuildClientePageable';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BuildClientePageable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.content != null) {
      result
        ..add('content')
        ..add(serializers.serialize(object.content,
            specifiedType: const FullType(
                BuiltList, const [const FullType(BuildCliente)])));
    }
    if (object.pageable != null) {
      result
        ..add('pageable')
        ..add(serializers.serialize(object.pageable,
            specifiedType: const FullType(BuildPageable)));
    }
    if (object.totalPages != null) {
      result
        ..add('totalPages')
        ..add(serializers.serialize(object.totalPages,
            specifiedType: const FullType(int)));
    }
    if (object.totalElements != null) {
      result
        ..add('totalElements')
        ..add(serializers.serialize(object.totalElements,
            specifiedType: const FullType(int)));
    }
    if (object.last != null) {
      result
        ..add('last')
        ..add(serializers.serialize(object.last,
            specifiedType: const FullType(bool)));
    }
    if (object.size != null) {
      result
        ..add('size')
        ..add(serializers.serialize(object.size,
            specifiedType: const FullType(int)));
    }
    if (object.number != null) {
      result
        ..add('number')
        ..add(serializers.serialize(object.number,
            specifiedType: const FullType(int)));
    }
    if (object.first != null) {
      result
        ..add('first')
        ..add(serializers.serialize(object.first,
            specifiedType: const FullType(bool)));
    }
    if (object.sort != null) {
      result
        ..add('sort')
        ..add(serializers.serialize(object.sort,
            specifiedType: const FullType(BuildSort)));
    }
    if (object.numberOfElements != null) {
      result
        ..add('numberOfElements')
        ..add(serializers.serialize(object.numberOfElements,
            specifiedType: const FullType(int)));
    }
    if (object.empty != null) {
      result
        ..add('empty')
        ..add(serializers.serialize(object.empty,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  BuildClientePageable deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuildClientePageableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'content':
          result.content.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BuildCliente)]))
              as BuiltList<Object>);
          break;
        case 'pageable':
          result.pageable.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuildPageable)) as BuildPageable);
          break;
        case 'totalPages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'totalElements':
          result.totalElements = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'sort':
          result.sort.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuildSort)) as BuildSort);
          break;
        case 'numberOfElements':
          result.numberOfElements = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'empty':
          result.empty = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$BuildClientePageable extends BuildClientePageable {
  @override
  final BuiltList<BuildCliente> content;
  @override
  final BuildPageable pageable;
  @override
  final int totalPages;
  @override
  final int totalElements;
  @override
  final bool last;
  @override
  final int size;
  @override
  final int number;
  @override
  final bool first;
  @override
  final BuildSort sort;
  @override
  final int numberOfElements;
  @override
  final bool empty;

  factory _$BuildClientePageable(
          [void Function(BuildClientePageableBuilder) updates]) =>
      (new BuildClientePageableBuilder()..update(updates)).build();

  _$BuildClientePageable._(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.size,
      this.number,
      this.first,
      this.sort,
      this.numberOfElements,
      this.empty})
      : super._();

  @override
  BuildClientePageable rebuild(
          void Function(BuildClientePageableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildClientePageableBuilder toBuilder() =>
      new BuildClientePageableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildClientePageable &&
        content == other.content &&
        pageable == other.pageable &&
        totalPages == other.totalPages &&
        totalElements == other.totalElements &&
        last == other.last &&
        size == other.size &&
        number == other.number &&
        first == other.first &&
        sort == other.sort &&
        numberOfElements == other.numberOfElements &&
        empty == other.empty;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, content.hashCode),
                                            pageable.hashCode),
                                        totalPages.hashCode),
                                    totalElements.hashCode),
                                last.hashCode),
                            size.hashCode),
                        number.hashCode),
                    first.hashCode),
                sort.hashCode),
            numberOfElements.hashCode),
        empty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuildClientePageable')
          ..add('content', content)
          ..add('pageable', pageable)
          ..add('totalPages', totalPages)
          ..add('totalElements', totalElements)
          ..add('last', last)
          ..add('size', size)
          ..add('number', number)
          ..add('first', first)
          ..add('sort', sort)
          ..add('numberOfElements', numberOfElements)
          ..add('empty', empty))
        .toString();
  }
}

class BuildClientePageableBuilder
    implements Builder<BuildClientePageable, BuildClientePageableBuilder> {
  _$BuildClientePageable _$v;

  ListBuilder<BuildCliente> _content;
  ListBuilder<BuildCliente> get content =>
      _$this._content ??= new ListBuilder<BuildCliente>();
  set content(ListBuilder<BuildCliente> content) => _$this._content = content;

  BuildPageableBuilder _pageable;
  BuildPageableBuilder get pageable =>
      _$this._pageable ??= new BuildPageableBuilder();
  set pageable(BuildPageableBuilder pageable) => _$this._pageable = pageable;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  int _totalElements;
  int get totalElements => _$this._totalElements;
  set totalElements(int totalElements) => _$this._totalElements = totalElements;

  bool _last;
  bool get last => _$this._last;
  set last(bool last) => _$this._last = last;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  int _number;
  int get number => _$this._number;
  set number(int number) => _$this._number = number;

  bool _first;
  bool get first => _$this._first;
  set first(bool first) => _$this._first = first;

  BuildSortBuilder _sort;
  BuildSortBuilder get sort => _$this._sort ??= new BuildSortBuilder();
  set sort(BuildSortBuilder sort) => _$this._sort = sort;

  int _numberOfElements;
  int get numberOfElements => _$this._numberOfElements;
  set numberOfElements(int numberOfElements) =>
      _$this._numberOfElements = numberOfElements;

  bool _empty;
  bool get empty => _$this._empty;
  set empty(bool empty) => _$this._empty = empty;

  BuildClientePageableBuilder();

  BuildClientePageableBuilder get _$this {
    if (_$v != null) {
      _content = _$v.content?.toBuilder();
      _pageable = _$v.pageable?.toBuilder();
      _totalPages = _$v.totalPages;
      _totalElements = _$v.totalElements;
      _last = _$v.last;
      _size = _$v.size;
      _number = _$v.number;
      _first = _$v.first;
      _sort = _$v.sort?.toBuilder();
      _numberOfElements = _$v.numberOfElements;
      _empty = _$v.empty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildClientePageable other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuildClientePageable;
  }

  @override
  void update(void Function(BuildClientePageableBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuildClientePageable build() {
    _$BuildClientePageable _$result;
    try {
      _$result = _$v ??
          new _$BuildClientePageable._(
              content: _content?.build(),
              pageable: _pageable?.build(),
              totalPages: totalPages,
              totalElements: totalElements,
              last: last,
              size: size,
              number: number,
              first: first,
              sort: _sort?.build(),
              numberOfElements: numberOfElements,
              empty: empty);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'content';
        _content?.build();
        _$failedField = 'pageable';
        _pageable?.build();

        _$failedField = 'sort';
        _sort?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuildClientePageable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
