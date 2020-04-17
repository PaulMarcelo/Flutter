// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_sort.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildSort> _$buildSortSerializer = new _$BuildSortSerializer();

class _$BuildSortSerializer implements StructuredSerializer<BuildSort> {
  @override
  final Iterable<Type> types = const [BuildSort, _$BuildSort];
  @override
  final String wireName = 'BuildSort';

  @override
  Iterable<Object> serialize(Serializers serializers, BuildSort object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.unsorted != null) {
      result
        ..add('unsorted')
        ..add(serializers.serialize(object.unsorted,
            specifiedType: const FullType(bool)));
    }
    if (object.sorted != null) {
      result
        ..add('sorted')
        ..add(serializers.serialize(object.sorted,
            specifiedType: const FullType(bool)));
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
  BuildSort deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuildSortBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'unsorted':
          result.unsorted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'sorted':
          result.sorted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$BuildSort extends BuildSort {
  @override
  final bool unsorted;
  @override
  final bool sorted;
  @override
  final bool empty;

  factory _$BuildSort([void Function(BuildSortBuilder) updates]) =>
      (new BuildSortBuilder()..update(updates)).build();

  _$BuildSort._({this.unsorted, this.sorted, this.empty}) : super._();

  @override
  BuildSort rebuild(void Function(BuildSortBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildSortBuilder toBuilder() => new BuildSortBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildSort &&
        unsorted == other.unsorted &&
        sorted == other.sorted &&
        empty == other.empty;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, unsorted.hashCode), sorted.hashCode), empty.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuildSort')
          ..add('unsorted', unsorted)
          ..add('sorted', sorted)
          ..add('empty', empty))
        .toString();
  }
}

class BuildSortBuilder implements Builder<BuildSort, BuildSortBuilder> {
  _$BuildSort _$v;

  bool _unsorted;
  bool get unsorted => _$this._unsorted;
  set unsorted(bool unsorted) => _$this._unsorted = unsorted;

  bool _sorted;
  bool get sorted => _$this._sorted;
  set sorted(bool sorted) => _$this._sorted = sorted;

  bool _empty;
  bool get empty => _$this._empty;
  set empty(bool empty) => _$this._empty = empty;

  BuildSortBuilder();

  BuildSortBuilder get _$this {
    if (_$v != null) {
      _unsorted = _$v.unsorted;
      _sorted = _$v.sorted;
      _empty = _$v.empty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildSort other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuildSort;
  }

  @override
  void update(void Function(BuildSortBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuildSort build() {
    final _$result = _$v ??
        new _$BuildSort._(unsorted: unsorted, sorted: sorted, empty: empty);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
