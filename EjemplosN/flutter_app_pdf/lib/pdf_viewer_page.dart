import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class PdfViewerPage extends StatelessWidget {
  String path;
  @override
  Widget build(BuildContext context) {
      path = ModalRoute.of(context).settings.arguments;

  return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("Documento"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async => await _sharePdf(),
          ),
        ],
      ),
      path: path);
  }

  Future<void> _sharePdf() async {
    try {
      File file = File(path);
      Uint8List bytes = file.readAsBytesSync();
      await Share.file(
          'reporte', 'reporte.pdf', bytes.buffer.asUint8List(), 'application/pdf');
    } catch (e) {
      print('error: $e');
    }
  }

}
