import 'package:diplomado_app/models/categorias_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoriasProvider extends ChangeNotifier {
  Categories categorias = Categories();

  Future consultarCategorias() async {
    String url = 'https://quotes.rest/qod/categories';
    String token = 'iV60EipIQ9yDsyaEyDsOzOV1V3AlmItau4ktNZcG';

    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    //final categoriaResponse = CategoriaResponse.fromJson(response.body);

    notifyListeners();
  }
}
