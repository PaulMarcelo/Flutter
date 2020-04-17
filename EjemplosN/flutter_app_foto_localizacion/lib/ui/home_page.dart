import 'package:flutter/material.dart';
import 'package:flutter_app_foto_localizacion/persistencia/modelo/producto.dart';
import 'package:flutter_app_foto_localizacion/repository/persistencia/producto_db_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_app_foto_localizacion/util/util.dart';
import 'package:location/location.dart' as Loc;

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext context;
  Permission _permissionLocation;
  PermissionStatus _permissionStatusLocation;
  bool _serviceEnabled;
  ProductoDbRepository _repoProducto;
  Future<List<Producto>> _listaFromDB = Future.value();

  @override
  void initState() {
    super.initState();
    Util.getOrcreateFolderInAppDocDir('Pictures').then((String directory) {
      MyApp.pathFolder = directory;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    this._repoProducto = ProductoDbRepository.getInstance(MyApp.dataBase);
    this._listaFromDB = this._repoProducto.allCliente();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Flutter Foto - Localización',
          )),
      body: _buildBodyFromDB(),
      floatingActionButton: _crearBoton(),
    );
  }

  _crearBoton() {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: _navegar);
  }

  _navegar() async {
    _getStatusPermissionLocation();
    if (_permissionStatusLocation.isGranted) {
      _getServicesLocation();
    } else if (_permissionStatusLocation.isPermanentlyDenied) {
      Util.showDialogOpenSetting(this.context, "Localización");
    } else {
      requestPermission(_permissionLocation);
    }
  }

  _getStatusPermissionLocation() async {
    _permissionLocation = Permission.location;
    final status = await _permissionLocation.status;
    _permissionStatusLocation = status;
  }

  _getServicesLocation() async {
    _serviceEnabled = await Loc.Location().serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Loc.Location().requestService();
      if (!_serviceEnabled) {
        return;
      } else {
        Navigator.pushNamed(this.context, 'foto');
      }
    } else {
      Navigator.pushNamed(this.context, 'foto');
    }
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      if (permission.value == Permission.location.value) {
        _permissionStatusLocation = status;
      }
    });
  }

  FutureBuilder<List<Producto>> _buildBodyFromDB() {
    return FutureBuilder<List<Producto>>(
      future: this._listaFromDB,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildPostsFromDB(context, snapshot.data);
        } else {
          return Center(
            child: Text(
              "NO DATA",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }
      },
    );
  }

  ListView _buildPostsFromDB(BuildContext context, List<Producto> productos) {
    return ListView.builder(
      itemCount: productos.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
            elevation: 4,
            child: Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direccion) {
//                this._repoProducto.deleteAll();
              },
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      productos[index].titulo ?? "Sin Datos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lat: ${productos[index].lat} - Lon: ${productos[index].log}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                subtitle: Text(productos[index].pathFoto ?? "Sin Datos"),
                onTap: () =>
                    Navigator.pushNamed(context, 'foto', arguments: productos[index]),
              ),
            ));
      },
    );
  }
}
