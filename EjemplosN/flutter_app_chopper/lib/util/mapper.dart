import 'package:flutter_app_chopper/data/api/vo/response/build_cliente.dart';
import 'package:flutter_app_chopper/data/persistence/model/cliente.dart';

class Mapper {
  static Cliente mapToCliente(BuildCliente buildCliente) {
    // crea el objeto mediante el constructor con parametros
    // final cliente = Cliente(buildCliente.codcli, buildCliente.nombrecli);
    // crea el objeto mediante el constructor vacio
    final cliente = Cliente.vacio();
    cliente.codcli = buildCliente.codcli;
    cliente.nombrecli = buildCliente.nombrecli;
    return cliente;
  }

  static List<Cliente> mapToClientesList(List<BuildCliente> buildCliente) {
    List<Cliente> lista = List();
    buildCliente.forEach((element){
      final cliente = Cliente.vacio();
      cliente.codcli = element.codcli;
      cliente.nombrecli = element.nombrecli;
      lista.add(cliente);
    });
    return lista;
  }
}
