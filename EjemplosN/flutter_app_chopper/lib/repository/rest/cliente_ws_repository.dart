import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_chopper/constant/const_str_exception.dart';
import 'package:flutter_app_chopper/data/api/exception/service_forbidden_exception.dart';
import 'package:flutter_app_chopper/data/api/exception/service_notfound_exception.dart';
import 'package:flutter_app_chopper/data/api/exception/service_unauthorized_exception.dart';
import 'package:flutter_app_chopper/data/api/listener/cliente_service_listener.dart';
import 'package:flutter_app_chopper/data/api/service/cliente_service.dart';
import 'package:provider/provider.dart';

class ClienteWsRepository {
  ClienteWsRepository._();

  static void obtenerClientesPorVendedor(BuildContext context, int codvendedor,
      int pageNo, int paseSize, ClienteServiceListener listener,
      {bool showDialog: true}) async {
    if (showDialog) {
      listener.onClienteServiceExecute();
    }
    try {
      final response = await Provider.of<ClienteService>(context)
          .obtenerClientesPorVendedor(codvendedor, pageNo, paseSize);
      switch (response.statusCode) {
        case HttpStatus.ok:
          listener.onClienteServiceResponse(response.body);
          break;
        case HttpStatus.unauthorized:
          listener.onClienteServiceFailure(
              ServiceUnauthorizedException(ConstStrException.smsUnauthorized));
          break;
        case HttpStatus.forbidden:
          listener.onClienteServiceFailure(
              ServiceForbiddenException(ConstStrException.smsForbidden));
          break;
        case HttpStatus.notFound:
          listener.onClienteServiceFailure(
              ServiceNotFoundException(ConstStrException.smsNotFound));
          break;
        default:
          listener.onClienteServiceFailure(
              Exception(ConstStrException.smsNotFound));
          break;
      }
    } catch (e) {
      print(e);
      listener
          .onClienteServiceFailure(Exception(ConstStrException.smsUnhandled));
    }
  }
}
