import 'package:flutter/material.dart';
import 'package:flutter_app_listas/modelo/cliente.dart';

class HomePage extends StatelessWidget {
  final Cliente cliente = Cliente("id1", "Cliente 1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _bntListarSimple(context),
            _bntListarDoble(context)
          ],
        ),
      ),
    );
  }

  Widget _bntListarSimple(BuildContext context) {
    return RaisedButton(
        child: Text("Lista Simple"),
        onPressed: () {
          Navigator.pushNamed(context, 'simple');
        });
  }

  Widget _bntListarDoble(BuildContext context) {
    return RaisedButton(
        child: Text("Nuevo Pedido"),
        onPressed: () {
          //Se pasa el objeto cliente como parametro
          Navigator.pushNamed(context, 'doble', arguments: cliente);
        });
  }
}
