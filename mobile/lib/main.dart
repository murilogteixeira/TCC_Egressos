import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/view/admin/egressos_list.view.dart';
import 'package:mobile/view/egresso/Perfil/editar_perfil.view.dart';
import 'package:mobile/view/egresso/Perfil/perfil.view.dart';
import 'package:mobile/view/shared/login.view.dart';
import 'package:mobile/view/egresso/tabbar.view.dart';
import 'package:mobile/view/shared/recuperarSenha.view.dart';
import 'package:mobile/view/shared/splash.view.dart';

void main() => runApp(MyApp());

var mainColor = Color(0xff30559F);

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
      initialRoute: SplashScrenView.route,
      // initialRoute: EgressosListView.route,
      routes: {
        SplashScrenView.route: (context) => SplashScrenView(),
        LoginView.route: (context) => LoginView(),
        RecuperarSenha.route: (context) => RecuperarSenha(),
        TabBarAppView.route: (context) => TabBarAppView(
              egresso: ModalRoute.of(context).settings.arguments,
            ),
        EgressosListView.route: (context) => EgressosListView(),
        EditarPerfil.route: (context) => EditarPerfil(
              egresso: ModalRoute.of(context).settings.arguments,
            ),
        PerfilView.route: (context) => PerfilView(
              egresso: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}

String decodeUTF8(string) {
  return utf8.decode(string);
}

final inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Color(0xFF547DD9), width: 2.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Color(0xFFDCDDE0), width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

searchInputDecoration(String placeholder) {
  return InputDecoration(
    hintText: placeholder,
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: Color(0xFF547DD9), width: 1),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: Color(0xFFDCDDE0), width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
  );
}
