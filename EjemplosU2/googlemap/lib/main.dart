import 'package:flutter/material.dart';
import 'package:googlemap/pages/home_page.dart';
import 'package:googlemap/pages/splash_page.dart';

import 'pages/request_permission_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        RequestPermissionPage.routeName: (_) => RequestPermissionPage(),
      },
    );
  }
}
