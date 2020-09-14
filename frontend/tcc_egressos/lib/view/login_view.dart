import 'package:flutter/material.dart';
import 'package:tcc_egressos/view/consulta_view.dart';

class LoginView extends StatefulWidget {
  static var route = '/';

  final String title = "Login";

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
      ),
      body: Center(
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
                    decoration: InputDecoration(
                      hintText: "Digite seu e-mail...",
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
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 400,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Digite sua senha...",
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
                      Navigator.pushNamed(context, ConsultaView.route);
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
