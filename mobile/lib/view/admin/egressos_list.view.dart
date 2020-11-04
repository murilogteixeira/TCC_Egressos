import 'package:flutter/material.dart';

class EgressosListView extends StatefulWidget {
  static final route = '/consulta';
  @override
  _EgressosListViewState createState() => _EgressosListViewState();
}

class _EgressosListViewState extends State<EgressosListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Tela do administrador',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
