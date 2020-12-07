import 'package:flutter/material.dart';
import 'package:mobile/globals.dart';
import 'package:mobile/helpers/url.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    this.url = BaseURL.shared.resetSenha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueceu a Senha"),
        backgroundColor: mainColor,
      ),
      body: Stack(
        children: [
          WebView(
            key: _key,
            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
