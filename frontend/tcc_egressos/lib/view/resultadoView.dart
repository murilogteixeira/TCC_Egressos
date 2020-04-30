import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:intl/intl.dart';
import 'package:tcc_egressos/model/artigo.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text(widget.title ?? ""),
            ),
      body: SingleChildScrollView(
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
                        "Nome Sobrenome",
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
                        "http://lattes.cnpq.br/0568184033386528",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "SOBRENOME, Nome",
                        style: TextStyle(fontSize: 18),
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
                          "testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset testeset ",
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
                          children: listaArtigos.map((artigo) {
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
                          children: listaEventos.map((evento) {
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
      ),
    );
  }
}
