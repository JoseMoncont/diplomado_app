import 'package:diplomado_app/widgets/appBars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/frases_provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerFrase = Provider.of<FrasesProvider>(context);

    final frase = providerFrase.listaDeFrases![0];
    return Scaffold(
      appBar: appBarPrincipal('Frases', () {
        Navigator.pop(context);
      }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Frase del día:'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 253, 236),
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\"${frase.quote!}\""),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Autor: ${frase.author!}')
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  providerFrase.consultarFrase();
                },
                child: Text('Generar Frase'))
          ],
        ),
      ),
    );
  }
}
