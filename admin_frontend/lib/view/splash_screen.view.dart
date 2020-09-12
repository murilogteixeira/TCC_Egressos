import 'package:flutter/material.dart';
import 'package:tcc_egressos/service/autenticacao.service.dart';
import 'package:tcc_egressos/helpers/funcao.enum.dart';
import 'package:tcc_egressos/model/usuario.model.dart';
import 'package:tcc_egressos/view/consulta_view.dart';
import 'package:tcc_egressos/view/home_egresso.view.dart';
import 'package:tcc_egressos/view/login.view.dart';

class SplashScreenView extends StatefulWidget {
  static final route = 'splash';
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    _verificaUsuarioLogado();

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _verificaUsuarioLogado() {
    var usuario = AutenticacaoService.instance.getUsuario();
    if (usuario != null) {
      switch (usuario.funcao) {
        case Funcao.admin:
          Navigator.of(context).pushReplacementNamed(ConsultaView.route);
          break;
        case Funcao.egresso:
          Navigator.of(context).pushReplacementNamed(HomeEgressoView.route);
          break;
        default:
      }
    } else {
      Navigator.of(context).pushReplacementNamed(LoginView.route);
    }
  }
}
