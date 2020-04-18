import 'package:flutter/material.dart';
import 'package:flutter_app_pdf/util.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Ejemplo Generar PDF'),
        ),
        body: Center(
            child: Container(
                margin: EdgeInsets.only(top: 30),
                height: 40,
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Generar Reporte',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      reportView(context).then((path) {
                        Navigator.pushNamed(context, 'pdf', arguments: path);
                      });
                    }))),
      ),
    );
  }
}
