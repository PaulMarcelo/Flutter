import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_app_chopper/data/api/vo/util/build_pageable.dart';
import 'build_cliente.dart';
import '../util/build_sort.dart';
import 'build_cliente_pageable.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BuildClientePageable,
  BuildCliente,
  BuildSort,
  BuildPageable
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
