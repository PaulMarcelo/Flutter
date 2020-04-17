import 'package:flutter/material.dart';
import 'package:peliculas/src/constant/consts.dart';
import 'package:peliculas/src/models/detalle_actores_model.dart';

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  final DetalleActor detalleActor;
  double _screenSize = 0.0;

  CustomDialog({@required this.detalleActor});

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                detalleActor.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star),
                  Text(
                    detalleActor.popularity.toString(),
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _printDetailRow(detalleActor.birthday,
                      Text("Fecha Nacimiento: ${detalleActor.birthday}")),
                  _printDetailRow(detalleActor.placeOfBirth,
                      Text("Lugar Nacimiento: ${detalleActor.placeOfBirth}")),
                  _printDetailRow(detalleActor.deathday,
                      Text("Fecha Muerte: ${detalleActor.deathday}")),
                  _printDetailRow(
                      detalleActor.knownForDepartment,
                      Text(
                          "Departamento: ${detalleActor.knownForDepartment}")),
                  _printDetailRow(
                    detalleActor.biography,
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Container(
                          height: 150,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              detalleActor.biography,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text("Aceptar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Hero(
          tag: detalleActor.uniqueId,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 140.0,
                height: 140.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.scaleDown,
                        image:
                            new NetworkImage(detalleActor.getPosterImg())))),
          ),
        ),
        //...top circlular image part,
      ],
    );
  }

  Widget _printDetailRow(String condition, Widget widget) {
    return Visibility(
        visible: (condition != null && condition.isNotEmpty), child: widget);
  }
}
