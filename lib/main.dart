import 'package:diplomado_app/pages/dashboard.dart';
import 'package:diplomado_app/pages/inicio.dart';
import 'package:diplomado_app/pages/lista_frases.dart';
import 'package:diplomado_app/providers/categorias_provider.dart';
import 'package:diplomado_app/providers/frases_provider.dart';
import 'package:diplomado_app/providers/peliculas_provider.dart';
import 'package:diplomado_app/providers/usuarios_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FrasesProvider()),
        ChangeNotifierProvider(create: (_) => CategoriasProvider()),
        ChangeNotifierProvider(create: (_) => PeliculasProvider())
        // ChangeNotifierProvider(
        //   create: (_) => UsuarioProvider(),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const Inicio(),
      routes: {
        'home': (context) => const Inicio(),
        'dashboard': (context) => const Dashboard(),
        'lista_frases': (context) => const ListaDeFrases()
      },
    );
  }
}
