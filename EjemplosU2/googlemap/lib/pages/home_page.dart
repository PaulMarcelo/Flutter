import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/utils/map_style.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final HomeBloc _bloc = HomeBloc();
  // -0.1081339,-78.4699519,18z

  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(-0.1081339, -78.4699519), zoom: 15);

  final Completer<GoogleMapController> _completer = Completer();

  @override
  void initState() {
    super.initState();
    this._init();
    print("HOOOOOOOLA 😸");
  }

  Future<GoogleMapController> get _mapController async {
    return await _completer.future;
  }

  @override
  void dispose() {
    // _bloc.close();
    super.dispose();
  }

  _init() async {
    (await _mapController).setMapStyle(jsonEncode(mapStyle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: GoogleMap(
        initialCameraPosition: _initialPosition,
        zoomControlsEnabled: false,
        compassEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },
      ),
    ));
    //   return BlocProvider.value(
    //     value: this._bloc,
    //     child: Scaffold(
    //       body: SafeArea(
    //         child: Container(
    //           width: double.infinity,
    //           height: double.infinity,
    //           child: BlocBuilder<HomeBloc, HomeState>(
    //             builder: (_, state) {
    //               if (!state.gpsEnabled) {
    //                 return Center(
    //                   child: Text(
    //                     "Para utilizar la app active el GPS",
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 );
    //               }

    //               if (state.loading) {
    //                 return Center(
    //                   child: CircularProgressIndicator(
    //                     backgroundColor: Colors.red,
    //                   ),
    //                 );
    //               }

    //               final CameraPosition initialPosition = CameraPosition(
    //                 target: state.myLocation,
    //                 zoom: 15,
    //               );

    //               return Stack(
    //                 children: <Widget>[
    //                   GoogleMap(
    //                     initialCameraPosition: initialPosition,
    //                     zoomControlsEnabled: false,
    //                     compassEnabled: false,
    //                     myLocationEnabled: false,
    //                     markers: state.markers.values.toSet(),
    //                     polylines: state.polylines.values.toSet(),
    //                     polygons: state.polygons.values.toSet(),
    //                     onTap: (LatLng position) {
    //                       print("🎃🎃🎃  $position");
    //                       this._bloc.add(OnMapTap(position));
    //                     },
    //                     myLocationButtonEnabled: false,
    //                     onMapCreated: (GoogleMapController controller) {
    //                       this._bloc.setMapController(controller);
    //                     },
    //                   ),
    //                   Positioned(
    //                     bottom: 15,
    //                     right: 15,
    //                     child: FloatingActionButton(
    //                       onPressed: () => _bloc.goToMyPosition(),
    //                       child: Icon(
    //                         Icons.gps_fixed,
    //                         color: Colors.black,
    //                       ),
    //                       backgroundColor: Colors.white,
    //                     ),
    //                   )
    //                 ],
    //               );
    //             },
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
  }
}
