import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "LAT: ${_locationData?.latitude??""}, LNG: ${_locationData?.longitude??""}"),
            FlatButton(
              child: Text("Persimos"),
              onPressed: () {
                _getPermissionLocation();
              },
            ),
            FlatButton(
              child: Text("Servicios Localización"),
              onPressed: () {
                _getServicesLocation();
              },
            ),
            FlatButton(
              child: Text("Localización"),
              onPressed: ()async {
                _locationData = await location.getLocation();
                setState(() {

                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _getServicesLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  _getPermissionLocation() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

}
