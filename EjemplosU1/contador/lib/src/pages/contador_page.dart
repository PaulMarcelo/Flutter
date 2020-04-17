import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState ();
  }
}

class _ContadorPageState extends State <ContadorPage>{
  final  _styleText = TextStyle(fontSize: 25);
  int _conteo = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Nuumero de taps', style: _styleText),
              Text('$_conteo', style: _styleText),
            ],
        )
      ),
      floatingActionButton: _crearBotones()
    );
  }

  _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30,),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _reset,),
        Expanded(child: SizedBox(width: 5.0,)),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _sustraer,),
        SizedBox(width: 5.0,),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar,),
      ],
    );
  }

  void _agregar() {
    setState(() => _conteo++);
  }

   void _sustraer() {
    setState(() => _conteo--);
  }

   void _reset() {
    setState(() => _conteo=0);
  }
}