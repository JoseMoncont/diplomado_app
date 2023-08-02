import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/frases_response.dart';

class FrasesProvider extends ChangeNotifier {
  List<Quote>? listaDeFrases = [];
  bool cargando = true;

  Future consultarFrase() async {
    String url = 'https://quotes.rest/quote/random';
    String token = 'iV60EipIQ9yDsyaEyDsOzOV1V3AlmItau4ktNZcG';

    print('Estado 1: $cargando');
    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    final frasesResponse = FraseResponse.fromJson(response.body);
    cargando = false;
    print('Estado 2: $cargando');

    listaDeFrases = frasesResponse.contents!.quotes;
    print(listaDeFrases![0].quote);

    notifyListeners();
  }
}
