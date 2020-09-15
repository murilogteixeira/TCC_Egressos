import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = LoginViewController();
    var _formKey = GlobalKey<FormState>();

    String inputEmail;
    String inputSenha;

    UsuarioModel _login() {
      UsuarioModel usuario;
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        usuario = _controller.efetuarLogin(inputEmail, inputSenha);
        if (usuario == null) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Email ou senha inválido')));
        }
      }
      return usuario;
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) return 'Insira o seu email';
                return null;
              },
              onSaved: (value) => inputEmail = value,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.mail),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) return 'Insira a sua senha';
                return null;
              },
              onSaved: (value) => inputSenha = value,
              decoration:
                  InputDecoration(labelText: 'Senha', icon: Icon(Icons.lock)),
            ),
          ),
          RaisedButton(
            child: Text('Entrar'),
            onPressed: () {
              var usuario = _login();
              if (usuario != null) {
                switch (usuario.funcao) {
                  case Funcao.admin:
                    Navigator.of(context)
                        .pushReplacementNamed(ConsultaView.route);
                    break;
                  case Funcao.egresso:
                    Navigator.of(context)
                        .pushReplacementNamed(TabBarAppView.route);
                    break;
                  default:
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
