import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:googlemap/pages/request_permission_page.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    if (hasAccess) {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, RequestPermissionPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
