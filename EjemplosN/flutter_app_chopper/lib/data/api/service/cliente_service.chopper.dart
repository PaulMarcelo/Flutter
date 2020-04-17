// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ClienteService extends ClienteService {
  _$ClienteService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ClienteService;

  Future<Response<BuildClientePageable>> obtenerClientesPorVendedor(
      int codvendedor, int pageNo, int pageSize) {
    final $url =
        '/cliente/obtenerClientesPorVendedor/${codvendedor}/${pageNo}/${pageSize}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuildClientePageable, BuildClientePageable>($request);
  }
}
