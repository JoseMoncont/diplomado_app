import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:diplomado_app/pages/peliculas.dart';
import 'package:diplomado_app/widgets/appBars.dart';
import 'package:diplomado_app/widgets/textos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/frases_provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    // final providerUsuario = Provider.of<UsuarioProvider>(context);

    // final frase = providerFrase.listaDeFrases![0];
    return Scaffold(
        appBar: appBarPrincipal('My App', () {
          Navigator.pop(context);
        }),
        bottomNavigationBar: CircleNavBar(
          cornerRadius: BorderRadius.circular(20),
          color: Colors.green.shade100,
          circleWidth: 50,
          height: 50,
          activeIndex: tabIndex,
          activeIcons: const [
            Icon(Icons.movie),
            Icon(Icons.home),
            Icon(Icons.settings)
          ],
          inactiveIcons: [
            textoNavBar('Películas'),
            textoNavBar('Inicio'),
            textoNavBar('Ajustes'),
          ],
          onTap: (index) {
            tabIndex = index;
            pageController.jumpToPage(tabIndex);
          },
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (v) {
            tabIndex = v;
          },
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                child: PeliculasPage()),
            Container(
                width: double.infinity,
                height: double.infinity,
                child: const PageViewHome()),
            Container(
              color: Colors.green,
              width: double.infinity,
              height: double.infinity,
            )
          ],
        ));
  }
}

class PageViewHome extends StatelessWidget {
  const PageViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerFrase = Provider.of<FrasesProvider>(context);
    return providerFrase.cargando
        ? Center(child: Image.asset('assets/animations/cargando.gif'))
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Frase del día:'),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      Text('Autor: ${providerFrase.listaDeFrases![0].author}'),
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
                              child: Text(
                                  providerFrase.listaDeFrases![0].tags![index]),
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
                      //providerUsuario.consultarUsuario();

                      Navigator.pushNamed(context, 'lista_frases');
                    },
                    child: Text('Ver Usuarios'))
              ],
            ),
          );
  }
}
