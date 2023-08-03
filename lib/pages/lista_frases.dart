import 'package:diplomado_app/models/categorias_response.dart';
import 'package:diplomado_app/providers/usuarios_provider.dart';
import 'package:diplomado_app/widgets/appbars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaDeFrases extends StatelessWidget {
  const ListaDeFrases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final providerUsuario = Provider.of<UsuarioProvider>(context);

    //  final usuario = providerUsuario.listaDeUsuarios;

    return Scaffold(
      appBar: appBarPrincipal('Lista de Usuarios', () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            ListView.builder(
                primary: false,
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Text('usuario!.firstName!'),
                        Text('Descripción'),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
