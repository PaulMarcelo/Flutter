import 'package:chopper/chopper.dart';
import 'package:flutter_app_chopper/data/api/helpers/built_value_converter.dart';
import 'package:flutter_app_chopper/data/api/vo/response/build_cliente_pageable.dart';

import '../url_service_call.dart';

part 'cliente_service.chopper.dart';

@ChopperApi(baseUrl: UrlServiceCall.contextCliente)
abstract class ClienteService extends ChopperService {
  static ClienteService create() {
    final client = ChopperClient(
      baseUrl: UrlServiceCall.urlBase,
      services: [
        _$ClienteService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$ClienteService(client);
  }

  @Get(path: '/obtenerClientesPorVendedor/{codvendedor}/{pageNo}/{pageSize}')
  Future<Response<BuildClientePageable>> obtenerClientesPorVendedor(
      @Path('codvendedor') int codvendedor,
      @Path('pageNo') int pageNo,
      @Path('pageSize') int pageSize);

}
