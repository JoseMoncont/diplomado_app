import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/frases_response.dart';

class FrasesProvider extends ChangeNotifier {
  List<Quote>? listaDeFrases = [];

  // FrasesProvider() {
  //   consultarFrase();
  // }

  Future consultarFrase() async {
    String url = 'https://quotes.rest/quote/random';
    String token = 'iV60EipIQ9yDsyaEyDsOzOV1V3AlmItau4ktNZcG';

    final response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    final frasesResponse = FraseResponse.fromJson(response.body);

    listaDeFrases = frasesResponse.contents!.quotes;
    print(listaDeFrases![0].quote);

    notifyListeners();
  }
}
