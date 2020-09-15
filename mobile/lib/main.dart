import 'package:flutter/material.dart';
import 'package:mobile/view/login.view.dart';
import 'package:mobile/view/tabbar.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginView.route,
      routes: {
        LoginView.route: (context) => LoginView(),
        TabBarAppView.route: (context) => TabBarAppView(),
      },
    );
  }
}
