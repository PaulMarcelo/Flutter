import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'build_sort.dart';

part 'build_pageable.g.dart';

abstract class BuildPageable
    implements Built<BuildPageable, BuildPageableBuilder> {
  @nullable
  BuildSort get sort;

  @nullable
  int get offset;

  @nullable
  int get pageSize;

  @nullable
  int get pageNumber;

  @nullable
  bool get paged;

  @nullable
  bool get unpaged;

  BuildPageable._();

  factory BuildPageable([updates(BuildPageableBuilder b)]) = _$BuildPageable;

  static Serializer<BuildPageable> get serializer => _$buildPageableSerializer;

}
