import 'package:diplomado_app/models/usuario_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class UsuarioProvider extends ChangeNotifier {
//   List<UsuarioResponse> listaDeUsuarios = [];
//   bool cargando = true;

//   Future consultarUsuario() async {
//     String url = 'https://random-data-api.com/api/v2/users?size=5';
//     //String token = 'iV60EipIQ9yDsyaEyDsOzOV1V3AlmItau4ktNZcG';

//     print('Estado 1: $cargando');
//     final response = await http.get(
//       Uri.parse(url),
//     );

//    // final usuarioResponse = UsuarioResponse.fromJson(response.body);
//   // usuarioResponse = List<UsuarioResponse>.from(response.body)

//     print(usuarioResponse);

//     listaDeUsuarios = usuarioResponse;

//     print(usuarioResponse);
//     cargando = false;
//     print('Estado 2: $cargando');

//     // listaDeUsuarios = usuarioResponse;

//     notifyListeners();
//   }
// }
