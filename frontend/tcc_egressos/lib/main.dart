import 'package:flutter/material.dart';

import 'view/home_view.dart';
import 'view/resultado_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeView.route,
      routes: {
        HomeView.route: (context) => HomeView(title: "Egressos",),
        ResultadoView.route: (context) => ResultadoView(title: "Resultado",),
      },
    );
  }
}
