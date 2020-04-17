import 'package:flutter/material.dart';

import 'ui/home_page.dart';
import 'ui/listas_simple_page.dart';
import 'ui/order_purchase_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'simple': (BuildContext context) => ListasSimplePage(),
        'doble': (BuildContext context) => OrderPurchasePage(),
      },
    );
  }
}
