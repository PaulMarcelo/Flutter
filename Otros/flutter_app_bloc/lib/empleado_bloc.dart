import 'dart:async';

import 'package:flutter_app_bloc/empleado.dart';

class EmpleadoBloc {
  List<Empleado> _empleadoList = [
    Empleado(1, 'Empleado 1', 1000.0),
    Empleado(2, 'Empleado 2', 1000.0),
    Empleado(3, 'Empleado 3', 1000.0),
    Empleado(4, 'Empleado 4', 1000.0),
    Empleado(5, 'Empleado 5', 1000.0)
  ];

  //Stream controller
  final _empleadoListSC = StreamController<List<Empleado>>();

  final _empleadoSalarioIncrementSC = StreamController<Empleado>();

  final _empleadoSalarioDecrementSC = StreamController<Empleado>();

  //Getter Streams y Sinks

  Stream<List<Empleado>> get empleadoListStream => _empleadoListSC.stream;

  StreamSink<List<Empleado>> get empleadoListSink => _empleadoListSC.sink;

  StreamSink<Empleado> get empleadoSalarioIncrementSink =>
      _empleadoSalarioIncrementSC.sink;

  StreamSink<Empleado> get empleadoSalarioDecrementSink =>
      _empleadoSalarioDecrementSC.sink;

  //constructor
  EmpleadoBloc() {
    _empleadoListSC.add(_empleadoList);

    //escuchar cambios

    _empleadoSalarioIncrementSC.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementSC.stream.listen(_decrementSalario);
  }

  _incrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20 / 100;
    _empleadoList[empleado.id - 1].salario = salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  _decrementSalario(Empleado empleado) {
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20 / 100;
    _empleadoList[empleado.id - 1].salario = salarioActual - salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }

  //dispose

  void dispose() {
    _empleadoListSC.close();

    //escuchar cambios

    _empleadoSalarioIncrementSC.close();
    _empleadoSalarioDecrementSC.close();
  }

}
