import 'package:flutter/material.dart';

class ResultadoView extends StatefulWidget {
  final String title;
  ResultadoView({this.title});

  @override
  _ResultadoViewState createState() => _ResultadoViewState();
}

class _ResultadoViewState extends State<ResultadoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
