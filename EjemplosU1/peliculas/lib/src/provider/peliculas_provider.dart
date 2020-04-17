import 'dart:async';

import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/detalle_actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pelicula_model.dart';

class PeliculaProvider {
  String _apikey = 'edeebe9502d19f98cb9aea8284a9ef3f';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStream() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (this._cargando) return [];
    this._cargando = true;
    this._popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });
    final resp = await _procesarRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    this._cargando = false;
    return resp;
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key': _apikey,
      'language': _language
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsomList(decodedData['cast']);
    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apikey, 'language': _language, 'query': query});
    return await _procesarRespuesta(url);
  }

  Future<DetalleActor> getDetailActor(int idActor) async {
    final url = Uri.https(_url, '3/person/$idActor', {
      'api_key': _apikey,
      'language': _language
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final detailActor = new DetalleActor.fromJsonMap(decodedData);
    return detailActor;
  }

}
