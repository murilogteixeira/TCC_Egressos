import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/helpers/enum/funcao.dart';
import 'package:mobile/model/usuario.model.dart';
import 'package:mobile/view/tabbar.view.dart';

import 'consulta.view.dart';

class LoginView extends StatefulWidget {
  static final route = '/login';

  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _controller = LoginController();
  var _formKey = GlobalKey<FormState>();

  String inputEmail;
  String inputSenha;

  Future<bool> usuarioLogado() async {
    await Future.delayed(Duration(seconds: 2));
    return await _controller.usuario != null;
  }

  _goToHome() {
    Navigator.of(context).pushReplacementNamed(TabBarAppView.route);
  }

  Future<UsuarioModel> _login() async {
    UsuarioModel usuario;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      usuario = _controller.efetuarLogin(inputEmail, inputSenha);
      if (usuario == null) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Email ou senha inválido')));
      }
    }
    await Future.delayed(Duration(seconds: 2));
    return usuario;
  }

  entrarOnPressed() async {
    _controller.setLoading(true);
    var usuario = await _login();
    if (usuario != null) {
      switch (usuario.funcao) {
        case Funcao.admin:
          Navigator.of(context).pushReplacementNamed(ConsultaView.route);
          break;
        case Funcao.egresso:
          Navigator.of(context).pushReplacementNamed(TabBarAppView.route);
          break;
        default:
      }
    }
    _controller.setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    usuarioLogado().then((logado) {
      if (logado) {
        _goToHome();
      } else {
        _controller.setLoading(false);
      }
    });
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF547DD9)),
                ),
                SizedBox(height: 40),
                Text(
                  "Nome de Usuário",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return 'Insira o seu email';
                    return null;
                  },
                  onSaved: (value) => inputEmail = value,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide:
                          BorderSide(color: Color(0xFF547DD9), width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide:
                          BorderSide(color: Color(0xFFDCDDE0), width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide:
                          BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Senha",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) return 'Insira a sua senha';
                    return null;
                  },
                  onSaved: (value) => inputSenha = value,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide:
                          BorderSide(color: Color(0xFF547DD9), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide:
                          BorderSide(color: Color(0xFFDCDDE0), width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide:
                          BorderSide(color: Colors.red, width: 2.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 65,
          ),
          Observer(
            builder: (_) {
              return _controller.loading
                  ? CircularProgressIndicator()
                  : ButtonTheme(
                        minWidth: 192,
                        height: 50,
                        buttonColor: Color(0xFF30559F),
                        child: RaisedButton(
                        child: Text('Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: entrarOnPressed,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                  );
            },
          ),
          FlatButton(
            onPressed: null, 
            child: Text(
              "Esqueceu a senha?",
              style: TextStyle(
                decoration: TextDecoration.underline
              ),
            ),
          ),
        ],
      ),
    );
  }
}
