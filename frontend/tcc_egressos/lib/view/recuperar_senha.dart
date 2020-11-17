import 'package:flutter/material.dart';
import 'package:tcc_egressos/view/login_view.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RecuperarSenha extends StatefulWidget {
  static final route = "/recuperarSenha";
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  String title, url;
  bool isLoading = true;
  final _key = UniqueKey();

  _RecuperarSenhaState() {
    this.url = 'https://egressosbackend.herokuapp.com/accounts/password_reset/';
  }

  @override
  Widget build(BuildContext context) {
    launch(url);

    return LoginView();
  }
}
