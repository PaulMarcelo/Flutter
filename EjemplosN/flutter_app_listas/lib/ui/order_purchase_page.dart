import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_listas/constant/constant_colors.dart';
import 'package:flutter_app_listas/modelo/cliente.dart';
import 'package:flutter_app_listas/modelo/producto_entity.dart';
import 'package:flutter_app_listas/modelo/produto_agregado.dart';

import 'package:flutter_app_listas/util/util.dart' as util;

class OrderPurchasePage extends StatefulWidget {
  final Cliente cliente;
  OrderPurchasePage(this.cliente);
  @override
  _OrderPurchasePageState createState() => _OrderPurchasePageState();
}

class _OrderPurchasePageState extends State<OrderPurchasePage> {
  List<ProductoEntity> listaFromDB = List();
  List<ProductoAgregado> listaItemAgregado = List();
  String titulo;

  @override
  void initState() {
    super.initState();
    this.titulo=widget.cliente.nombre;
    //lleno la primera lista de productos, simulacion de productos recuperados desde la db
    util.fillListProductFormDB().then((rows) {
      setState(() {
        listaFromDB = rows;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ConstColors.colorBlue,
          //se usa el objeto cliente mediante    widget.cliente.nombre
          title: Text('Nuevo pedido ' + this.titulo),
          actions: <Widget>[
            util.simplePopup(),
          ],
        ),
        body: Column(
          children: <Widget>[
            buildDropDownLineas(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildDropDownFamilias(),
                buildDropDownSubFamilias()
              ],
            ),
            buildBuscador(size),
            buildTitulosProductos(),
            //----Primera lista de los productos recuperados desde la DB
            Expanded(
              child: Container(
                height: size.height,
                child: ListView.separated(
                    //Widget lista
                    separatorBuilder: (context, index) => Divider(
                          height: 0.1,
                          color: Colors.black,
                        ),
                    itemCount: listaFromDB.length, //total de items de la lista
                    itemBuilder: (BuildContext context, int position) {
                      return buildRowProducto(
                          position); //funcion que construye la fila del productoDB
                    }),
              ),
            ),
            buildTitulosProductosAgregados(),
            //----Segunda lista de los productos agregados
            Expanded(
              child: Container(
                height: size.height / 2,
                child: ListView.separated(
                    //Widget lista
                    separatorBuilder: (context, index) => Divider(
                          height: 0.1,
                          color: Colors.black,
                        ),
                    itemCount: listaItemAgregado.length,
                    //total de items de la lista
                    itemBuilder: (BuildContext context, int position) {
                      return buildRowProductoAgregado(
                          position); //funcion que construye la fila del producto agregado
                    }),
              ),
            ),
            buildTitulosTotal1(),
            buildTitulosTotal2(),
            buildTitulosTotal3(),
          ],
        ));
  }

  Widget buildRowProducto(int i) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            util.buildTextGeneric(listaFromDB[i].nombre),
            util.buildTextGeneric("${listaFromDB[i].precio}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
            Container(
                width: 50.0,
                height: 20.0,
                child: RaisedButton(
                  child: Text(
                    "NC",
                    style: TextStyle(fontSize: 12.0, color: Colors.red),
                  ),
                  onPressed: () {},
                  color: ConstColors.colorGrey,
                )),
            Container(
                width: 45.0,
                height: 20.0,
                child: RaisedButton(
                  child: Text(
                    "-1",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  onPressed: () => removeItem(listaFromDB[i]),
                  color: ConstColors.colorGrey,
                )),
            Column(
              children: <Widget>[Text("-2"), Text("UND")],
            ),
            Container(
                width: 45.0,
                height: 20.0,
                child: RaisedButton(
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 10.0),
                  ),
                  onPressed: () => addItem(listaFromDB[i]),
                  color: ConstColors.colorGrey,
                )),
            Container(
              width: 70.0,
              height: 30.0,
              child: Container(
                color: ConstColors.colorGrey,
              ),
            ),
          ],
        )
      ],
    );
  }

  //Metodo para remover el item de la lista
  removeItem(ProductoEntity itemSelection) {
    if (listaItemAgregado.isNotEmpty) {
      ProductoAgregado productoEncontrado = listaItemAgregado.firstWhere(
          (it) => it.producto.codigo == itemSelection.codigo,
          orElse: () => null);
      if (productoEncontrado != null) {
        //actualiza item si ya esta agregado
        double cantidad = productoEncontrado.cantidad - 1;
        if (cantidad <= 0) {
          listaItemAgregado.remove(productoEncontrado);
        } else {
          productoEncontrado.cantidad = cantidad;
          productoEncontrado.total =
              productoEncontrado.cantidad * productoEncontrado.producto.precio;
        }
        setState(() {
          // set State refresca la vista con los nunevos datos agregados
        });
      }
    }
  }

  //Metodo para agregar el item a la lista
  addItem(ProductoEntity itemSelection) {
    if (listaItemAgregado.isNotEmpty) {
      ProductoAgregado productoEncontrado = listaItemAgregado.firstWhere(
          (it) => it.producto.codigo == itemSelection.codigo,
          orElse: () => null);
      if (productoEncontrado != null) {
        //actualiza item si ya esta agregado
        productoEncontrado.cantidad = productoEncontrado.cantidad + 1;
        productoEncontrado.total =
            productoEncontrado.cantidad * productoEncontrado.producto.precio;
      } else {
        _agregaProducto(itemSelection);
      }
    } else {
      _agregaProducto(itemSelection);
    }
    setState(() {
      // set State refresca la vista con los nunevos datos agregados
    });
  }

  _agregaProducto(ProductoEntity itemSelection) {
    ProductoAgregado productoEncontrado = ProductoAgregado();
    productoEncontrado.producto = itemSelection;
    productoEncontrado.cantidad = 1;
    productoEncontrado.total =
        productoEncontrado.cantidad * productoEncontrado.producto.precio;
    listaItemAgregado.add(productoEncontrado);
  }

  //---
  Widget buildRowProductoAgregado(int i) {
    return Container(
      color: ConstColors.colorGrey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "${i + 1}",
                  textAlign: TextAlign.center,
                ),
              ),
              Text(listaItemAgregado[i].producto.nombre),
              Text("${listaItemAgregado[i].cantidad}"),
              Text("${listaItemAgregado[i].producto.precio}"),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text("${listaItemAgregado[i].total}"),
              )
            ],
          ),
        ],
      ),
    );
  }

  //-------------------------------------------------------------
  Widget buildDropDownLineas() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 35.0,
        child: DropdownButton<String>(
          hint: Text('Lineas'),
          isExpanded: true,
          items: <String>[
            'Todas las Lineas',
            'Materia Prima',
            'Mano de obra',
            'Triturado'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget buildDropDownFamilias() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      height: 35.0,
      child: DropdownButton<String>(
        hint: Text('Familias'),
        items: <String>['Todas las Familias'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }

  Widget buildDropDownSubFamilias() {
    return Container(
      height: 35.0,
      padding: EdgeInsets.only(right: 10.0),
      child: DropdownButton<String>(
        hint: Text('Sub Familias'),
        items: <String>['Todas las Sub Familias'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }

  Widget buildBuscador(Size size) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            width: size.width * 0.85,
            height: 25.0,
            color: Color(0xff3894BC),
            child: TextField(
              style: TextStyle(
                  color: Colors.white, backgroundColor: Color(0xff3894BC)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Busqueda...',
                hintStyle: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          height: 25.0,
          color: ConstColors.colorGrey,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget buildTitulosProductos() {
    return Container(
        padding: EdgeInsets.only(top: 5.0),
        height: 25.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Productos en el telefono",
                    style:
                        TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold)),
                Text("Ninguna Busqueda de productos",
                    style:
                        TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Devolución", style: TextStyle(fontSize: 8.0)),
                Text("Disponibilidad", style: TextStyle(fontSize: 8.0)),
                Text("Pedido", style: TextStyle(fontSize: 8.0))
              ],
            )
          ],
        ));
  }

  Widget buildTitulosProductosAgregados() {
    return Container(
        height: 20.0,
        color: Color(0xff3894BC),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Producto", style: TextStyle(color: Colors.white)),
            Text("Cantidad", style: TextStyle(color: Colors.white)),
            Text("Pu/Desc.", style: TextStyle(color: Colors.white)),
            Text("S.Tot", style: TextStyle(color: Colors.white))
          ],
        ));
  }

  Widget buildTitulosTotal1() {
    return Container(
        color: Color(0xff3894BC),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("U.Prod=3"),
            Text("U.Cambio=0"),
            Text("U.Promo=0")
          ],
        ));
  }

  Widget buildTitulosTotal2() {
    return Container(
        padding: EdgeInsets.only(left: 20.0),
        color: Color(0xff3894BC),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("S.TOT: 039", style: TextStyle(color: Colors.white)),
            Text("B.T.CERO: 0.00", style: TextStyle(color: Colors.white)),
            Text("Desc.:0.00", style: TextStyle(color: Colors.white)),
            Text("Desc.NC: 0.00", style: TextStyle(color: Colors.white)),
          ],
        ));
  }

  Widget buildTitulosTotal3() {
    return Container(
        padding: EdgeInsets.only(left: 20.0),
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("IVA: 0.00"),
                Text("TOTAL: 0.00"),
              ],
            ),
            Row(
              children: <Widget>[
                botonesGeneral(
                    context, 'btn1', Icons.comment, Colors.deepOrangeAccent),
                botonesGeneral(context, 'btn2', Icons.check, Colors.blue),
                botonesGeneral(context, 'btn3', Icons.dehaze, Colors.red),
              ],
            )
          ],
        ));
  }

  FloatingActionButton botonesGeneral(
      BuildContext context, String name, IconData icon, Color color) {
    return FloatingActionButton(
      heroTag: name,
      child: Icon(icon),
      mini: true,
      elevation: 50.0,
      backgroundColor: color,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return util.simpleDialog(context);
            });
      },
    );
  }
}
