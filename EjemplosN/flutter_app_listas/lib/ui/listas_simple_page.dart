import 'package:flutter/material.dart';

class ListasSimplePage extends StatefulWidget {
  @override
  _ListasSimplePage createState() => _ListasSimplePage();
}

class _ListasSimplePage extends State<ListasSimplePage> {
  List<String> listaString = List(); // Lista para ir agregando items
  int contador = 0;

  @override
  void initState() {
    super.initState();
    _fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Titulo de la pagina
        title: Text("Lista Simple"),
      ),
      body: ListView.separated(
        //Lista con linea separadora por item
        itemCount: listaString.length,
        //se le asigna el tamaño de la lista obligatorio
        itemBuilder: (context, index) {
          //itemBuilder va recorriendo los items de la lista
          //context es el contexto de la vista donde se muestra la lista, index es el indice de cada item de la lista
//          return Text(listaString[index]); //muestro el texto
          return GestureDetector( 
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(listaString[index]),
            ),
            onTap: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(index.toString()))),
          );
        },
        separatorBuilder: (context, index) {
          //Linea separadora por item
          return Divider(); // puede ser cualquier widget
        },
      ),
      floatingActionButton: FloatingActionButton(
        // boton flotante en la parte inferior de la pantalla para agrega un item a la lista
        child: Icon(Icons.add),
        onPressed:
            addItem, // addItemm es una fucnion que agrega un item a la lista
      ),
    );
  }

  _fillList() {
    //por defecto inicializo la lista con 2 elementos
    //esto es solo para el ejemplo
    for (var i = 0; i <= 2; i++) {
      listaString.add("item $i");
      contador = i;
    }
  }

  void addItem() {
    setState(() {
      contador++;
      // set State refresca la vista con los nunevos datos agregados
      listaString.add("item $contador");
    });
  }
}
