import 'package:flutter/material.dart';
import 'package:egresso_app/view/home.dart';

class Login extends StatefulWidget {
  static final route = '/login';

  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    var _formKey = GlobalKey<FormState>();
    final _user = 'mail@mail.com';
    final _pass = '123';

    String inputEmail;
    String inputPass;

    bool _login() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if (_user != inputEmail || _pass != inputPass) {
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
              onSaved: (value) => inputPass = value,
              decoration:
                  InputDecoration(labelText: 'Senha', icon: Icon(Icons.lock)),
            ),
          ),
          RaisedButton(
            child: Text('Entrar'),
            onPressed: () {
              if (_login()) {
                // Próxima tela
                Navigator.of(context).pushReplacementNamed(Home.route);
              }
            },
          ),
        ],
      ),
    );
  }
}
