
import 'package:flutter/material.dart';
import 'package:mobile/view/admin/egressos_list.view.dart';
import 'package:mobile/view/egresso/Perfil/editar_perfil.view.dart';
import 'package:mobile/view/egresso/Perfil/perfil.view.dart';
import 'package:mobile/view/shared/login.view.dart';
import 'package:mobile/view/egresso/tabbar.view.dart';
import 'package:mobile/view/shared/recuperarSenha.view.dart';
import 'package:mobile/view/shared/splash.view.dart';

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
