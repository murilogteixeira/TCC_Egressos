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
      appBar: AppBar(title: Text('Login')),
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
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) return 'Insira a sua senha';
                return null;
              },
              onSaved: (value) => inputSenha = value,
              decoration:
                  InputDecoration(labelText: 'Senha', icon: Icon(Icons.lock)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Observer(
              builder: (_) {
                return _controller.loading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text('Entrar'),
                        onPressed: entrarOnPressed,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
