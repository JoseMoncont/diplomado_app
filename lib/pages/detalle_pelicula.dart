import 'package:diplomado_app/pages/peliculas.dart';
import 'package:diplomado_app/widgets/appbars.dart';
import 'package:flutter/material.dart';

import '../models/peliculas.dart';

class DetallePelicula extends StatelessWidget {
  const DetallePelicula({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pelicula peli =
        ModalRoute.of(context)!.settings.arguments as Pelicula;
    return Scaffold(
      appBar: appBarPrincipal('Detalle Película', () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [
          FadeInImage(
              fadeOutDuration: const Duration(milliseconds: 100),
              width: MediaQuery.of(context).size.width,
              height: 400,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/noload.png'),
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original/${peli.posterPath}',
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              peli.title!,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                filaDato('Fecha lanzamiento',
                    peli.releaseDate.toString().substring(0, 10)),
                filaDato('Puntaje', peli.voteAverage.toString()),
                const SizedBox(
                  height: 10,
                ),
                Text(peli.overview!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
