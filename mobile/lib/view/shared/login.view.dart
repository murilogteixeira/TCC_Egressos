import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/helpers/enum/funcao.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/usuario.dart';
import 'package:mobile/view/egresso/tabbar.view.dart';

import '../admin/consulta.view.dart';

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

  Usuario usuario;
  String inputEmail;
  String inputSenha;

  Future<Usuario> verificaLoginEmCache() async {
    Future.delayed(Duration(seconds: 1));
    _controller.setLoading(true);
    usuario = await _controller.usuario;
    _controller.setLoading(false);
    return usuario;
  }

  _login() async {
    await _loginValidate()
        ? _goToHome()
        : _showMessageError('Email ou senha inválido');
  }

  Future<bool> _loginValidate() async {
    var retorno = true;
    _controller.setLoading(true);
    usuario = await _controller.efetuarLogin(inputEmail, inputSenha);
    if (usuario == null) {
      retorno = false;
    }
    _controller.setLoading(false);
    return retorno;
  }

  entrarOnPressed() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _login();
    }
  }

  _goToHome() {
    if (usuario != null) {
      usuario.isStaff
          ? Navigator.of(context).pushReplacementNamed(ConsultaView.route)
          : Navigator.of(context).pushReplacementNamed(TabBarAppView.route);
    }
  }

  _showMessageError(String texto) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  @override
  Widget build(BuildContext context) {
    verificaLoginEmCache().then((usuarioLogado) {
      if (usuarioLogado != null) {
        _goToHome();
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
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
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
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
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
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: entrarOnPressed,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    );
            },
          ),
          FlatButton(
            onPressed: null,
            child: Text(
              "Esqueceu a senha?",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
