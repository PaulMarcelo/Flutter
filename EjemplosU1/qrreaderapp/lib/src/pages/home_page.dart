import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: scansBloc.borrarScanTODOS)
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scanQR(context),
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              title: Text('Mapas'),
              icon: Icon(
                Icons.map,
                size: 30.0,
              )),
          BottomNavigationBarItem(
              title: Text('Direcciones'),
              icon: Icon(
                Icons.brightness_5,
                size: 30.0,
              )),
        ]);
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }

  _scanQR(BuildContext context) async {

    String futureString;

    try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = '';
    }

    if (futureString != null && futureString.isNotEmpty) {
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.abrirScan(context, scan);
        });
      } else {
        utils.abrirScan(context, scan);
      }
    }
  }
}
