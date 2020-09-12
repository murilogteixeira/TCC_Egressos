import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/view/consulta_view.dart';
import 'package:tcc_egressos/view/login.view.dart';

class SplashScreenView extends StatefulWidget {
  static final route = 'splash';
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    _verificaUsuarioLogado().then((logado) {
      if (logado) {
        Navigator.of(context).pushReplacementNamed(ConsultaView.route);
      }
      else {
        Navigator.of(context).pushReplacementNamed(LoginView.route);
      }
    });
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> _verificaUsuarioLogado() async {
    var pref = await SharedPreferences.getInstance();
    var usuario = pref.getString('usuario');
    return usuario == null ? false : true;
  }
}
