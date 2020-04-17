import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          Navigator.pushNamed(context, 'doble');
        });
  }
}
