import 'package:flutter/material.dart';

appBarPrincipal(String titulo, VoidCallback alPresionar) {
  return AppBar(
    leading: IconButton(
      onPressed: alPresionar,
      icon: const Icon(Icons.arrow_back_rounded),
      color: Colors.white,
    ),
    backgroundColor: Colors.green,
    title: Text(
      titulo,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
