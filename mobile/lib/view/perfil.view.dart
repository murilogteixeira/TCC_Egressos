import 'package:flutter/material.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/view/login.view.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Perfil View'),
            RaisedButton(
              child: Text('Logout'),
              onPressed: () {
                LoginController().logout();
                Navigator.of(context).pushReplacementNamed(LoginView.route);
              },
            )
          ],
        ),
      ),
    );
  }
}
