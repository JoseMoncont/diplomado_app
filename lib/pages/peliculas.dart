import 'package:diplomado_app/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeliculasPage extends StatelessWidget {
  const PeliculasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerpelicula = Provider.of<PeliculasProvider>(context);
    final pelicula = providerpelicula.listaPelicuals;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Lista de Películas',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 400, maxWidth: 500),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: pelicula!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/original/${pelicula[index].backdropPath}',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  pelicula[index].title!,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              filaDato(
                                  'Fecha Lanzamiento',
                                  pelicula[index]
                                      .releaseDate
                                      .toString()
                                      .substring(0, 10)),
                              filaDato('Puntaje Prom.',
                                  pelicula[index].voteAverage.toString())
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey.shade400,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

filaDato(String label, String dato) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
      SizedBox(
        width: 5,
      ),
      Text(dato)
    ],
  );
}
