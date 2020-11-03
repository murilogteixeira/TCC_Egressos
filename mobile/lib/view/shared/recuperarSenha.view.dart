import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecuperarSenha extends StatefulWidget {
  static final route = "/recuperarSenha";
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  var _inputDecoration = InputDecoration(
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

  var userLeftTheView = false;

  _solicitarRecuperacaoSenha(String email) {
    print(
        'RecuperarSenhaView, linha 29: Realizar solicitação ao backend para recuperar a senha');
  }

  _mostrarSnackBar(BuildContext context, String text) async {
    const duration = 4000;
    var snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      duration: Duration(milliseconds: duration),
    );
    Scaffold.of(context).showSnackBar(snackBar);
    await Future.delayed(Duration(milliseconds: duration + 500));
    if (!userLeftTheView) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var recuperarSenhaURL =
        'https://egressosbackend.herokuapp.com/accounts/password_reset/';

    return WillPopScope(
      onWillPop: () async {
        userLeftTheView = true;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Esqueceu a Senha"),
          backgroundColor: Color(0xFF547DD9),
        ),
        body: WebView(initialUrl: recuperarSenhaURL),
      ),
    );
  }
}
