import 'package:flutter_app_chopper/data/persistence/dao/cliente_dao.dart';
import 'package:flutter_app_chopper/data/persistence/model/cliente.dart';

import '../../data/persistence/app_database.dart';


class ClienteDbRepository {
  AppDatabase _dataBase;
  ClienteDao clienteDao;
  static ClienteDbRepository _instance;

  static ClienteDbRepository getInstance(dataBase) {
    if (_instance == null) {
      _instance = ClienteDbRepository._(dataBase);
      return _instance;
    }
    return _instance;
  }

  ClienteDbRepository._(this._dataBase) {
    this.clienteDao = this._dataBase.clienteDao;
  }

  Future<void> insertar(Cliente cliente) async {
    await this.clienteDao.insertCliente(cliente);
  }

  void insertarAll(List<Cliente> clientes) async {
    await this.clienteDao.insertClienteAll(clientes);
  }

  void deleteAll() async {
    await this.clienteDao.deleteAll();
  }

  Future<List<Cliente>> allCliente() async {
    return await this.clienteDao.findAllCliente();
  }

}
