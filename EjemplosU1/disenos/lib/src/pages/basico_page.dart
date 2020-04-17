import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estitlotitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estitloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(context),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lago con un puente',
                    style: estitlotitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Un lago en alemania',
                    style: estitloSubtitulo,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones(BuildContext context,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(context,Icons.call, 'CALL'),
        _accion(context,Icons.near_me, 'ROUTE'),
        _accion(context,Icons.share, 'SHARE')
      ],
    );
  }

  Widget _accion(BuildContext context, IconData icon, String texto) {
    final accion= Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          texto,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'botones');
      },
      child: accion,
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            'Lorem pariatur exercitation fugiat reprehenderit nulla duis esse nisi nisi duis adipisicing.Lorem pariatur exercitation fugiat reprehenderit nulla duis esse nisi nisi duis adipisicing.Lorem pariatur exercitation fugiat reprehenderit nulla duis esse nisi nisi duis adipisicing.Lorem pariatur exercitation fugiat reprehenderit nulla duis esse nisi nisi duis adipisicing.',
            textAlign: TextAlign.justify,
          )),
    );
  }
}
