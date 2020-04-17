import 'package:flutter/material.dart';
import 'package:flutter_app_chopper/constant/const_str_app.dart';
import 'package:flutter_app_chopper/data/api/exception/service_forbidden_exception.dart';
import 'package:flutter_app_chopper/data/api/exception/service_notfound_exception.dart';
import 'package:flutter_app_chopper/data/api/exception/service_unauthorized_exception.dart';
import 'package:flutter_app_chopper/data/api/listener/cliente_service_listener.dart';
import 'package:flutter_app_chopper/data/api/vo/response/build_cliente_pageable.dart';
import 'package:flutter_app_chopper/data/persistence/model/cliente.dart';
import 'package:flutter_app_chopper/repository/persistence/cliente_db_repository.dart';
import 'package:flutter_app_chopper/repository/rest/cliente_ws_repository.dart';
import 'package:flutter_app_chopper/data/persistence/app_base.dart';
import 'package:flutter_app_chopper/util/mapper.dart';
import 'package:flutter_app_chopper/util/util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ClientePage extends StatefulWidget {
  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage>
    implements ClienteServiceListener {
  ProgressDialog _dialog;
  double _percentage = 0.0;
  int _nextPage = 0;
  int _totalPage = 1;
  int _codvendedor = 59;
  int _totalRecordDB = 0;
  static const int FIRST_PAGE = 0;
  static const int PAGE_SIZE = 100;
  Future<List<Cliente>> _listaFromDB = Future.value();
  ClienteDbRepository _repoCilente;

  bool _showLabel = false;

  @override
  void initState() {
    super.initState();
    this._repoCilente = ClienteDbRepository.getInstance(AppBase.dataBase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chooper - Floor"),
        ),
        body: Container(
            padding: new EdgeInsets.all(1.0),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _bntSincronizarClientes(),
                    _bntListar(),
                    _bntBorrar()
                  ],
                ),
              ),
              Visibility(
                  visible: _showLabel,
                  child: Text('Registros en la DB:  $_totalRecordDB')),
              Expanded(
                child: _buildBodyFromDB(),
              )
            ])));
  }

// Codigo que sincroniza los clientes

  Widget _bntSincronizarClientes() {
    return RaisedButton(
        child: Text(ConstStrApp.labelSyncCliente),
        onPressed: () {
          //llama al ws
          ClienteWsRepository.obtenerClientesPorVendedor(
              context, this._codvendedor, FIRST_PAGE, PAGE_SIZE, this);
        });
  }

  @override
  void onClienteServiceExecute() {
    // muestra el cuadro de dialogo
    this._dialog = Util.showDialogDownload(
        context, ConstStrApp.downloadWait, this._percentage);
  }

  @override
  void onClienteServiceResponse(BuildClientePageable response) {
    if (response.first) {
      //elimina los datos del movil
      this._repoCilente.deleteAll();
    }
    // procesa respuesta
    this._totalPage = response.totalPages;
    this._nextPage = response.pageable.pageNumber + 1;

    Future.delayed(Duration(seconds: 1)).then((onValue) {
      double aumentar = 100 / this._totalPage;

      Future.delayed(Duration(seconds: 1)).then((value) {
        //procesa almacenamiento en DB
        this
            ._repoCilente
            .insertarAll(Mapper.mapToClientesList(response.content.asList()));
        Util.updatePercentageDialog(this._dialog, this._percentage, aumentar);
      });

      if (response.last) {
        this._listaFromDB = Future.value();
        this._showLabel = false;
        Util.hideDialogAndShowToast(
            _dialog, ConstStrApp.downloadSuccess, _percentage);
        setState(() {});
      } else {
        //vuelve a llamar al ws
        ClienteWsRepository.obtenerClientesPorVendedor(
            context, this._codvendedor, this._nextPage, PAGE_SIZE, this,
            showDialog: false);
      }
    });
  }

  @override
  void onClienteServiceFailure(Exception t) {
    //Se necesita validar error devuelto por ws
    String message;
    if (t is ServiceUnauthorizedException) {
      message = t.errMsg;
    } else if (t is ServiceForbiddenException) {
      message = t.errMsg;
    } else if (t is ServiceNotFoundException) {
      message = t.errMsg;
    } else {
      message = ConstStrApp.downloadError;
    }
    Util.hideDialogAndShowToast(this._dialog, message, this._percentage);
  }

// Codigo que muestra el listado de clientes

  Widget _bntListar() {
    return RaisedButton(
        child: Text(ConstStrApp.labelList),
        onPressed: () async {
          this._dialog = Util.showDialogWait(context, ConstStrApp.listing);
          this._showLabel = true;
          Future.delayed(Duration(seconds: 1)).then((value) async {
            this._listaFromDB = this._repoCilente.allCliente();
            this._listaFromDB.then((rows) {
              setState(() {
                this._totalRecordDB = rows.length;
              });
            });
            this._dialog.hide();
          });
        });
  }

  FutureBuilder<List<Cliente>> _buildBodyFromDB() {
    return FutureBuilder<List<Cliente>>(
      future: this._listaFromDB,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final clientes = snapshot.data;
          return _buildPostsFromDB(context, clientes);
        } else {
          this._totalRecordDB = 0;
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

  ListView _buildPostsFromDB(BuildContext context, List<Cliente> clientes) {
    return ListView.builder(
      itemCount: clientes.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              clientes[index].nombrecli ?? "Sin Datos",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(clientes[index].codcli ?? "Sin Datos"),
            onTap: () => {},
          ),
        );
      },
    );
  }

  Widget _bntBorrar() {
    return RaisedButton(
        child: Text(ConstStrApp.labelDeleteCliente),
        onPressed: () {
          this._repoCilente.deleteAll();
          this._showLabel = false;
          this._listaFromDB = Future.value();
          setState(() {
            Fluttertoast.showToast(msg: ConstStrApp.labelDelete);
          });
        });
  }
}
