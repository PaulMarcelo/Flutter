import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_foto_localizacion/main.dart';
import 'package:flutter_app_foto_localizacion/persistencia/modelo/producto.dart';
import 'package:flutter_app_foto_localizacion/repository/persistencia/producto_db_repository.dart';
import 'package:flutter_app_foto_localizacion/util/util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as Loc;
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class FotoPage extends StatefulWidget {
  @override
  _FotoPageState createState() => _FotoPageState();
}

class _FotoPageState extends State<FotoPage> {
  BuildContext context;
  final formKey = GlobalKey<FormState>();

  Permission _permissionWriteRead;
  PermissionStatus _permissionStatusWriteRead;
  Permission _permissionCamera;
  PermissionStatus _permissionStatusCamera;

  File foto;
  Loc.LocationData _locationData;
  Loc.Location location = Loc.Location();

  String lat;
  String log;
  String titulo;
  String path;

  Producto producto;
  ProductoDbRepository _repoProducto;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
    _getLocation();
    this._repoProducto = ProductoDbRepository.getInstance(MyApp.dataBase);
  }

  void _listenForPermissionStatus() async {
    _getStatusPermissionWriteRead();
    _getStatusPermissionCamara();
  }

  void _getLocation() async {
    _locationData = await location.getLocation();
    this.lat = _locationData.latitude.toString();
    this.log = _locationData.longitude.toString();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Producto prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      this.producto = prodData;
      this.titulo = prodData.titulo;
      this.lat = prodData.lat;
      this.log = prodData.log;
      this.path = prodData.pathFoto;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Foto-Localización"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _mostrarFoto(),
                  _crearNombre(),
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  _seleccionarFoto() {
    _getStatusPermissionWriteRead();
    if (_permissionStatusWriteRead.isGranted) {
      _procesarImagen(ImageSource.gallery);
    } else if (_permissionStatusWriteRead.isPermanentlyDenied) {
      Util.showDialogOpenSetting(context, "Almacenamiento");
    } else {
      requestPermission(_permissionWriteRead);
    }
  }

  _getStatusPermissionWriteRead() async {
    _permissionWriteRead = Permission.storage;
    final status = await _permissionWriteRead.status;
    setState(() => _permissionStatusWriteRead = status);
  }

  _tomarFoto() async {
    _getStatusPermissionCamara();
    if (_permissionStatusCamera.isGranted) {
      _procesarImagen(ImageSource.camera);
    } else if (_permissionStatusCamera.isPermanentlyDenied) {
      Util.showDialogOpenSetting(context, "Foto");
    } else {
      requestPermission(_permissionCamera);
    }
  }

  _getStatusPermissionCamara() async {
    _permissionCamera = Permission.camera;
    final status = await _permissionCamera.status;
    setState(() => _permissionStatusCamera = status);
  }

  _procesarImagen(ImageSource origen) async {
    final foto = await ImagePicker.pickImage(source: origen);
    setState(() {
      this.foto = foto;
      if (foto != null) producto?.pathFoto = null;
    });
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      if (permission.value == Permission.storage.value) {
        _permissionStatusWriteRead = status;
      } else if (permission.value == Permission.camera.value) {
        _permissionStatusCamera = status;
      } else if (permission.value == Permission.location.value) {}
    });
  }

  Widget _mostrarFoto() {
    ImageProvider image;
    if (producto?.pathFoto != null) {
      image = FileImage(File(producto.pathFoto));
      return FadeInImage(
        image: image,
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );
    } else {
      if (foto?.path != null) {
        image = FileImage(foto);
      } else {
        image = AssetImage('assets/no-image.png');
      }
      return Image(
        image: image,
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => titulo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese más de 3 caracteres para el nombre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.blue,
        textColor: Colors.white,
        label: Text('Guardar'),
        icon: Icon(Icons.save),
        onPressed: _submit);
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    _getLocation();
    if (foto != null) {
      final fileName = basename(foto.path);
      final File localImage = await foto.copy('${MyApp.pathFolder}/$fileName');
      this.producto = Producto.vacio();
      this.producto.titulo = titulo;
      this.producto.lat = lat;
      this.producto.log = log;
      this.producto.pathFoto = localImage.path;
      this._repoProducto.insertar(this.producto);
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(msg: "Requiere una foto");
    }
  }
}
