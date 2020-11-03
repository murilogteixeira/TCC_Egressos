import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/recuperarSenha.controller.dart';
import 'package:mobile/main.dart';

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
    var _controller = RecuperarSenhaController();

    var formKey = GlobalKey<FormState>();
    String inputEmail;

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
        body: Builder(
          builder: (context) => Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Observer(
                    builder: (context) => TextFormField(
                      enabled: !_controller.isLoading,
                      decoration: _inputDecoration,
                      validator: (value) {
                        const msgErro = 'Email inválido';
                        if (value.isEmpty) return msgErro;

                        var stringSeparatedByAtSign = value.split('@');
                        var domainSeparatedByDot =
                            stringSeparatedByAtSign[1].split('.');

                        if (stringSeparatedByAtSign.length != 2) return msgErro;
                        if (stringSeparatedByAtSign[0].length <= 0 ||
                            stringSeparatedByAtSign[1].length <= 0)
                          return msgErro;

                        if (domainSeparatedByDot.length <= 1) return msgErro;

                        return null;
                      },
                      onSaved: (value) => inputEmail = value,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: SizedBox(
                      width: 192,
                      height: 50,
                      child: RaisedButton(
                        color: mainColor,
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            _controller.setIsLoading(true);
                            _solicitarRecuperacaoSenha(inputEmail);
                            _mostrarSnackBar(
                              context,
                              'Confira o seu email!\n\nCaso esteja válido, em breve receberá as instruções de recuperação.',
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
