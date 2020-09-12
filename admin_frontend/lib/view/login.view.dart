import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/controller/login.view_controller.dart';
import 'package:tcc_egressos/model/usuario.model.dart';
import 'package:tcc_egressos/view/consulta_view.dart';

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
    
    bool _login() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if (!_controller.efetuarLogin(inputEmail, inputSenha)) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Email ou senha inválido')));
          return false;
        }
        return true;
      }
      return false;
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
              if (_login()) {
                // Próxima tela
                Navigator.of(context).pushReplacementNamed(ConsultaView.route);
              }
            },
          ),
        ],
      ),
    );
  }
}
