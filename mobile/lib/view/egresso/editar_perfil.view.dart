import 'package:flutter/material.dart';

class EditarPerfil extends StatefulWidget {
  static final route = '/editar_perfil';

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: Container(),
    );
  }
}
