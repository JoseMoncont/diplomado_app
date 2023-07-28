import 'package:diplomado_app/widgets/botones.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            alignment: Alignment.center,
            child: const Text(
              'Exención de Responsabilidad',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text(
                'Proident ullamco eu anim dolore aliquip Lorem adipisicing ex mollit. Dolor reprehenderit est amet nisi exercitation commodo. Tempor nisi nulla reprehenderit est ea occaecat. Tempor excepteur et aute laborum amet excepteur consectetur duis officia nostrud elit incididunt et eu. Nostrud laboris mollit elit laborum reprehenderit incididunt dolore et irure id dolor exercitation est. Duis do aliqua sint aute est laboris eiusmod magna sit deserunt et elit irure.'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                botonPrincipal('Política de Privacidad', () {
                  print(
                    'Este es el botón 1',
                  );
                }, context),
                botonPrincipal('Términos de Servicio', () {
                  print('Este es el botón 2');
                }, context)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: const Text(
                'Al pulsar el botón "iniciar" que aparece abajo, reconozco que he leído y acepto la política de privacidad y los términos de servicio de BauBau SAS.'),
          ),
          botonHuella('Iniciar', context, () {
            print('Botón Iniciar Presionado');
            Navigator.pushNamed(context, 'dashboard');
          })
        ],
      ),
    );
  }

  botonHuella(
      String textoBoton, BuildContext context, VoidCallback alPresionar) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: alPresionar,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/huella.png',
            width: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
              bottom: 30,
              left: 55,
              child: Text(
                textoBoton.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              )),
        ],
      ),
    );
  }
}
