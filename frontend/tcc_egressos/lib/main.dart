import 'package:flutter/material.dart';
import 'package:tcc_egressos/view/consulta_view.dart';
import 'package:tcc_egressos/view/curriculo_view.dart';

import 'view/resultado_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egressos UCB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: CurriculoView.route,
      routes: {
        ConsultaView.route: (context) => ConsultaView(),
        ResultadoView.route: (context) => ResultadoView(),
        CurriculoView.route: (context) => CurriculoView(),
      },
    );
  }
}
