import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_app_chopper/data/api/vo/util/build_pageable.dart';
import '../util/build_sort.dart';
import 'build_cliente.dart';

part 'build_cliente_pageable.g.dart';

abstract class BuildClientePageable
    implements Built<BuildClientePageable, BuildClientePageableBuilder> {

  @nullable
  BuiltList<BuildCliente> get content;

  @nullable
  BuildPageable get pageable;

  @nullable
  int get totalPages;

  @nullable
  int get totalElements;

  @nullable
  bool get last;

  @nullable
  int get size;

  @nullable
  int get number;

  @nullable
  bool get first;

  @nullable
  BuildSort get sort;

  @nullable
  int get numberOfElements;

  @nullable
  bool get empty;

  BuildClientePageable._();

  factory BuildClientePageable([updates(BuildClientePageableBuilder b)]) =
  _$BuildClientePageable;

  static Serializer<BuildClientePageable> get serializer =>
      _$buildClientePageableSerializer;

}
