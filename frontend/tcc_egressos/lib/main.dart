import 'package:flutter/material.dart';
import 'package:tcc_egressos/view/homeView.dart';
import 'package:tcc_egressos/view/resultadoView.dart';

void main() {
  runApp(MyApp());
}

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
      initialRoute: "/",
      routes: {
        "/": (context) => HomeView(title: "Egressos",),
        "/resultado": (context) => ResultadoView(title: "Resultado",),
      },
    );
  }
}