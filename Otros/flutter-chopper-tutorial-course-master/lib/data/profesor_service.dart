import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:chopper_tutorial/model/built_profesor.dart';

import 'built_value_converter.dart';
part 'profesor_service.chopper.dart';

@ChopperApi(baseUrl: '/profesores')
abstract class ProfesorService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltProfesor>>> getProfesors();

  static ProfesorService create() {
    final client = ChopperClient(
      baseUrl: 'http://192.168.100.25:8080/api',
      services: [
        _$ProfesorService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$ProfesorService(client);
  }

}