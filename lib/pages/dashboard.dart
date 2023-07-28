import 'package:diplomado_app/widgets/appBars.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPrincipal('Dashboard', () {
        Navigator.pop(context);
      }),
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
