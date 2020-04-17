import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_listas/modelo/producto_entity.dart';

Widget simplePopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("First"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Second"),
        ),
      ],
    );

SimpleDialog simpleDialog(BuildContext context) {
  return SimpleDialog(
    title: const Text('Sincronizar datos'),
    children: <Widget>[
      estructuraDialogo(context, 'Todo'),
      estructuraDialogo(context, 'Clientes'),
      estructuraDialogo(context, 'Productos'),
      estructuraDialogo(context, 'Datos adicionales'),
    ],
  );
}

SimpleDialogOption estructuraDialogo(BuildContext context, String texto) {
  return SimpleDialogOption(
    onPressed: () {},
    child: Text(texto),
  );
}

Future<List<ProductoEntity>> fillListProductFormDB() async {
  List<ProductoEntity> list = List();
  for (var i = 0; i <= 10; i++) {
    list.add(ProductoEntity(
        "prod$i", "Producto $i", Random().nextInt(100).toDouble()));
  }
  await new Future.delayed(new Duration(seconds: 1));
  return list;
}

Widget buildTextGeneric(String texto) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 2.0),
      child: Text(texto, style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  );
}
