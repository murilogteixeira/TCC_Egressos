import 'package:egresso_app/view/login.dart';
import 'package:egresso_app/view/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egresso App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Login.route,
      routes: {
        Login.route: (context) => Login(),
        Home.route: (context) => Home()
      },
    );
  }
}
