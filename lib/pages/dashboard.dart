import 'package:diplomado_app/providers/categorias_provider.dart';
import 'package:diplomado_app/widgets/appBars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/frases_provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerFrase = Provider.of<FrasesProvider>(context);
    final providerCategoria = Provider.of<CategoriasProvider>(context);
    final categoria = providerCategoria.categorias;

    // final frase = providerFrase.listaDeFrases![0];
    return Scaffold(
      appBar: appBarPrincipal('Frases', () {
        Navigator.pop(context);
      }),
      body: providerFrase.cargando
          ? Center(child: Image.asset('assets/animations/cargando.gif'))
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Frase del día:'),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 253, 236),
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\"${providerFrase.listaDeFrases![0].quote}\""),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Autor: ${providerFrase.listaDeFrases![0].author}'),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                providerFrase.listaDeFrases![0].tags!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(providerFrase
                                    .listaDeFrases![0].tags![index]),
                              );
                            })
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        providerFrase.consultarFrase();
                      },
                      child: Text('Generar Frase')),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        providerCategoria.consultarCategorias();

                        Navigator.pushNamed(context, 'lista_frases');
                      },
                      child: Text('Ver frases'))
                ],
              ),
            ),
    );
  }
}
