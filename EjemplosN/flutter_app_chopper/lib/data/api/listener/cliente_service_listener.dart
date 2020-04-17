import 'package:flutter_app_chopper/data/api/vo/response/build_cliente_pageable.dart';

abstract class ClienteServiceListener {
  void onClienteServiceExecute();
  void onClienteServiceResponse(BuildClientePageable response);
  void onClienteServiceFailure(Exception t);
}
