import 'package:flutter/material.dart';
import 'package:tcc_egressos/view/consulta_view.dart';

class LoginView extends StatefulWidget {
  static var route = '/';

  final String title = "Login";

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
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 400,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) return 'Insira o seu email';
                      return null;
                    },
                    onSaved: (value) => inputEmail = value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.mail),
                      // hintText: "Digite seu e-mail...",
                      enabledBorder: new UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 400,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) return 'Insira a sua senha';
                      return null;
                    },
                    onSaved: (value) => inputPass = value,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(Icons.lock),
                      // hintText: "Digite sua senha...",
                      enabledBorder: new UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    // onSaved: (nome) {
                    //   this._nome = nome;
                    // },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: MaterialButton(
                    height: 50,
                    minWidth: 140,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    onPressed: () {},
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: MaterialButton(
                    color: Color(0xFF547DD9),
                    height: 50,
                    minWidth: 140,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    onPressed: () {
                      if (_login()) {
                        Navigator.pushNamed(context, ConsultaView.route);
                      }
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
