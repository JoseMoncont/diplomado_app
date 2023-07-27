import 'package:flutter/material.dart';

botonPrincipal(String titulo, VoidCallback alPresionar, BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width / 2.7,
      child: ElevatedButton(
          onPressed: alPresionar,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff4CAF50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          )));
}
