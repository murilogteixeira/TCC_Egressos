import 'package:flutter/material.dart';

class ConsultaView extends StatefulWidget {
  static final route = '/consulta';
  @override
  _ConsultaViewState createState() => _ConsultaViewState();
}

class _ConsultaViewState extends State<ConsultaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
        child: Text('Tela do administrador', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
  }
}