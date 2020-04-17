import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  double _sizeScreenPer = 0.0;
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);
  final Function siguientePagina;

  MovieHorizontal(@required this.peliculas, @required this.siguientePagina);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          (_pageController.position.maxScrollExtent - 200)) {
        this.siguientePagina();
      }
    });

    if (_isLargeScreen(context)) {
      this._sizeScreenPer = 0.21;
    } else {
      this._sizeScreenPer = 0.31;
    }

    return Container(
      height: _screenSize.height * this._sizeScreenPer,
      child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas.length,
//          children: _tarjetas(context),
          itemBuilder: (context, i) => _tarjeta(context, peliculas[i])),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueId= '${pelicula.id}-tarjeta';
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 152.0,
              ),
            ),
          ),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.title,
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
      child: tarjeta,
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return _tarjeta(context, pelicula);
    }).toList();
  }

  bool _isLargeScreen(BuildContext context) {
    if (MediaQuery.of(context).size.height > 600) {
      return true;
    } else {
      return false;
    }
  }
}
