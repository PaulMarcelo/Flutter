import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'build_sort.g.dart';

abstract class BuildSort implements Built<BuildSort, BuildSortBuilder> {
  @nullable
  bool get unsorted;

  @nullable
  bool get sorted;

  @nullable
  bool get empty;

  BuildSort._();

  factory BuildSort([updates(BuildSortBuilder b)]) = _$BuildSort;

  static Serializer<BuildSort> get serializer => _$buildSortSerializer;

}
