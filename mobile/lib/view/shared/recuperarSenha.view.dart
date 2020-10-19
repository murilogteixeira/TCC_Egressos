import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {
  static final route = "recuperarSenha";
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

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    String inputEmail;

    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueceu a Senha"),
      ),
      body: Form(
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
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) return 'Insira o seu email';
                  return null;
                },
                onSaved: (value) => inputEmail = value,
                decoration: _inputDecoration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
