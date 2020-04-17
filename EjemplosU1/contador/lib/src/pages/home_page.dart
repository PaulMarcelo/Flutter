import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle styleText = TextStyle(fontSize: 25);
  int conteo = 0 ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Nuumero de clicks', style: styleText),
              Text('0', style: styleText),
            ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('asdasd');
        },
      ),
    );
  }
}
