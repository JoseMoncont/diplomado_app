import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

textoNavBar(String texto) {
  return Text(
    texto,
    style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade600),
  );
}
