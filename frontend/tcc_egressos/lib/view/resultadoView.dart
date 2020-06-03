import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/model/artigo.dart';
import 'package:tcc_egressos/model/curriculoLattes.dart';
import 'package:tcc_egressos/model/evento.dart';

class ResultadoView extends StatefulWidget {
  final String title;
  ResultadoView({this.title});

  @override
  _ResultadoViewState createState() => _ResultadoViewState();
}

class _ResultadoViewState extends State<ResultadoView> {
  var listaArtigos = [
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Artigo(
        nome: "Artigo teste",
        dataPublicacao: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
  ];
  var listaEventos = [
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
    Evento(
        nome: "Evento teste",
        data: DateTime.now(),
        descricao: "Descricao teste teste teste teste teste teste teste."),
  ];

  Future<CurriculoLattes> curriculoLattes;
  Future<String> curriculoLattesStr;

  Future<CurriculoLattes> _getCurriculo() async {
    curriculoLattesStr = _getCurriculoStr();
    return curriculoLattesStr
        .then((value) => CurriculoLattes.fromJson(json.decode(value)));
  }

  Future<String> _getCurriculoStr() async {
    return await SharedPreferences.getInstance()
        .then((value) => value.getString("curriculoLattes"));
  }

  @override
  Widget build(BuildContext context) {
    curriculoLattes = _getCurriculo();
    return FutureBuilder(
        future: curriculoLattes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: kIsWeb
                    ? null
                    : AppBar(
                        title: Text(widget.title ?? ""),
                      ),
                body: _mostrarCurriculo(snapshot.data));
          }
          return Scaffold(
            body: Text("Não encontrado"),
          );
        });
  }

  _mostrarCurriculo(CurriculoLattes curriculo) {
    print(curriculo.toString());
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),

            // Nome
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Nome:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      curriculo.nome,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),

            // Lattes ID
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Lattes ID:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      curriculo.lattesID,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),

            // Nome citação
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Nome Citação:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        curriculo.nomeCitacao,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Descricao
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Descrição:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        curriculo.descricao,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Artigos
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Artigos:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                        children: curriculo.artigos.map((artigo) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              artigo.nome,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              DateFormat("dd/MM/yyyy HH:mm")
                                  .format(artigo.dataPublicacao),
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              artigo.descricao,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }).toList()),
                  ),
                ],
              ),
            ),

            //Eventos
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Eventos:",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                        children: curriculo.eventos.map((evento) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              evento.nome,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              DateFormat("dd/MM/yyyy HH:mm")
                                  .format(evento.data),
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              evento.descricao,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }).toList()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
