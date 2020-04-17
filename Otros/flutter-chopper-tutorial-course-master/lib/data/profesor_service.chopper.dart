// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profesor_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ProfesorService extends ProfesorService {
  _$ProfesorService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ProfesorService;

  Future<Response<BuiltList<BuiltProfesor>>> getProfesors() {
    final $url = '/profesores';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<BuiltProfesor>, BuiltProfesor>($request);
  }
}
