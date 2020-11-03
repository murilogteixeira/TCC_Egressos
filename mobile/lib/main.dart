import 'package:flutter/material.dart';
import 'package:mobile/view/admin/consulta.view.dart';
import 'package:mobile/view/egresso/Perfil/editar_perfil.view.dart';
import 'package:mobile/view/shared/login.view.dart';
import 'package:mobile/view/egresso/tabbar.view.dart';
import 'package:mobile/view/shared/recuperarSenha.view.dart';

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
      initialRoute: LoginView.route,
      // initialRoute: ConsultaView.route,
      // initialRoute: TabBarAppView.route,
      routes: {
        LoginView.route: (context) => LoginView(),
        RecuperarSenha.route: (context) => RecuperarSenha(),
        TabBarAppView.route: (context) =>
            TabBarAppView(egresso: ModalRoute.of(context).settings.arguments),
        ConsultaView.route: (context) => ConsultaView(),
        EditarPerfil.route: (context) =>
            EditarPerfil(egresso: ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
