

import 'package:flutter_app_foto_localizacion/persistencia/app_database.dart';
import 'package:flutter_app_foto_localizacion/persistencia/dao/producto_dao.dart';
import 'package:flutter_app_foto_localizacion/persistencia/modelo/producto.dart';

class ProductoDbRepository {
  AppDatabase _dataBase;
  ProductoDao clienteDao;
  static ProductoDbRepository _instance;

  static ProductoDbRepository getInstance(dataBase) {
    if (_instance == null) {
      _instance = ProductoDbRepository._(dataBase);
      return _instance;
    }
    return _instance;
  }

  ProductoDbRepository._(this._dataBase) {
    this.clienteDao = this._dataBase.productoDao;
  }

  Future<void> insertar(Producto producto) async {
    await this.clienteDao.insertProducto(producto);
  }
  void deleteAll() async {
    await this.clienteDao.deleteAll();
  }

  Future<List<Producto>> allCliente() async {
    return await this.clienteDao.findAllProducto();
  }

}
