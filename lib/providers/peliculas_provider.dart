import 'package:diplomado_app/models/peliculas.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider extends ChangeNotifier {
  List<Pelicula>? listaPelicuals = [];

  Future consultarPeliculas() async {
    String url = 'https://api.themoviedb.org/3/discover/movie';
    String token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZWY1MDYwMDI5Zjk0MmUwYTZiNjRhNTVlYWYwMWU0NyIsInN1YiI6IjY0Y2MxOTkwNDNjZDU0MDBhZGQ1ZTA0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.c1vlk0bGT5Fqv-zbe4dpUTOlmRUfXr5TlHBdN9z8GKk';

    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    final peliculaResponse = MovieResponse.fromJson(response.body);

    listaPelicuals = peliculaResponse.results;

    notifyListeners();
  }
}
