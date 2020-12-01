import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/egresso/home.controller.dart';
import 'package:mobile/controller/egresso/producoes.controller.dart';
import 'package:mobile/controller/shared/login.controller.dart';
import 'package:mobile/controller/shared/perfil.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/usuario.dart';
import 'package:mobile/view/egresso/Perfil/View/dadosGeraisView.dart';
import 'package:mobile/view/egresso/Perfil/View/producoesView.dart';
import 'package:mobile/view/egresso/home/home.view.dart';
import 'package:mobile/view/egresso/home/producoes.view.dart';
import 'package:mobx/mobx.dart';

import '../../../globals.dart';
import 'editar_perfil.view.dart';

class PerfilView extends StatefulWidget {
  static final route = '/perfil';
  final dynamic usuario;

  const PerfilView({Key key, this.usuario}) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  PerfilController _controller;
  Color situacaoEgressoColor;
  DadosGeraisView dadosGeraisView;
  ProducoesView producoesEgressoView;
  bool producoesCarregadas = false;

  @override
  Widget build(BuildContext context) {
    Usuario usuario;
    Egresso egresso;
    bool isGestor = false;

    switch (widget.usuario.runtimeType) {
      case Egresso:
        egresso = widget.usuario;
        isGestor = true;
        break;
      case Usuario:
        usuario = widget.usuario;
        break;
      default:
    }

    _controller =
        PerfilController(egresso: egresso == null ? usuario.egresso : egresso);

    dadosGeraisView = DadosGeraisView(controller: _controller);

    switch (_controller.egresso.situacao.tipo) {
      case "Adiantado":
        situacaoEgressoColor = Color(0xFF70D169);
        break;
      case "Regular":
        situacaoEgressoColor = Colors.lightBlue;
        break;
      case "Atrasado":
        situacaoEgressoColor = Colors.red;
    }

    _controller.setInformacoesEgresso(dadosGeraisView);

    fetchProducoes() async {
      var controller = HomeController(egresso: egresso);
      var producoes = await controller.fetchProducoes();
      var medias = await controller.fetchMedias();
      producoesEgressoView = ProducoesView(
        producoes: producoes,
        mediaProducoes: medias,
      );
    }

    var dadosGeraisButton = Container(
      width: 130.0,
      color: Colors.white,
      child: FlatButton(
        onPressed: () {
          _controller.setInformacoesEgresso(dadosGeraisView);
        },
        child: Text(
          "Dados Gerais",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
            color: Color(0xFF547DD9),
          ),
        ),
      ),
    );

    var producoesButton = Container(
      width: 130.0,
      color: Colors.white,
      child: FlatButton(
        onPressed: () async {
          _controller.setInformacoesEgresso(CircularProgressIndicator());
          await fetchProducoes();
          _controller.setInformacoesEgresso(producoesEgressoView);
        },
        child: Text(
          "Produções",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
            color: Color(0xFF547DD9),
          ),
        ),
      ),
    );

    var menuButtons =
        isGestor ? [dadosGeraisButton, producoesButton] : [dadosGeraisButton];

    _controller.getPerfil();

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: mainColor,
        actions: [
          FlatButton(
            child: Text(
              'Sair',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              LoginController().logout(context);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: mainColor,
        onPressed: () async {
          await Navigator.of(context)
              .pushNamed(EditarPerfil.route, arguments: _controller.egresso);
          _controller.getPerfil();
        },
      ),
      body: Observer(
        builder: (_) => _controller.egresso == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 40),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/placeholder-person.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          _controller.egresso.nome,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Color(0xFF547DD9),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 109,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: situacaoEgressoColor),
                          child: Text(
                            _controller.egresso.situacao.tipo,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 50.0,
                        color: Colors.white,
                        width: (MediaQuery.of(context).size.width),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: menuButtons,
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) => _controller.informacoesEgresso,
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
      ),
    );
  }
}
