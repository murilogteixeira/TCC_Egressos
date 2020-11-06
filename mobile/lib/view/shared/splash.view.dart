import 'package:flutter/material.dart';
import 'package:mobile/controller/shared/login.controller.dart';
import 'package:mobile/model/usuario.dart';
import 'package:mobile/view/egresso/tabbar.view.dart';
import 'package:mobile/view/shared/login.view.dart';

class SplashScrenView extends StatefulWidget {
  static final route = '/splash';

  @override
  _SplashScrenViewState createState() => _SplashScrenViewState();
}

class _SplashScrenViewState extends State<SplashScrenView> {
  var _controller = LoginController();
  Usuario _usuario;

  Future<Usuario> verificaLoginEmCache() async {
    await Future.delayed(Duration(seconds: 1));
    _usuario = await _controller.usuario;
    return _usuario;
  }

  _goToLogin() {
    Navigator.of(context).pushReplacementNamed(LoginView.route);
  }

  _goToHome() {
    Navigator.of(context).pushReplacementNamed(TabBarAppView.route, arguments: _usuario.egresso);
  }

  @override
  Widget build(BuildContext context) {
    verificaLoginEmCache().then((usuarioLogado) {
      usuarioLogado == null ? _goToLogin() : _goToHome();
    });
    
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Carregando...'),
        ),
      ),
    );
  }
}
