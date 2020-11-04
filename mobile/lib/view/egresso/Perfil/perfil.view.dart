import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/shared/login.controller.dart';
import 'package:mobile/controller/shared/perfil.controller.dart';
import 'package:mobile/main.dart';
import 'package:mobile/view/egresso/Perfil/View/dadosGeraisView.dart';
import 'package:mobile/view/egresso/Perfil/View/producoesView.dart';
import 'package:mobile/view/shared/login.view.dart';

import 'editar_perfil.view.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  var _controller = PerfilController();
  DadosGeraisView dadosGeraisView;
  ProducoesEgressoView producoesEgressoView = ProducoesEgressoView();

  @override
  Widget build(BuildContext context) {
    dadosGeraisView = DadosGeraisView(
      controller: _controller,
    );
    _controller.setInformacoesEgresso(dadosGeraisView);
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
              LoginController().logout();
              Navigator.of(context).pushReplacementNamed(LoginView.route);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.of(context)
              .pushNamed(EditarPerfil.route, arguments: _controller.egresso);
        },
      ),
      body: Observer(
        builder: (_) => _controller.egresso == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 10, top: 40),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(180),
                            child: Image.network(
                              'https://www.pngitem.com/pimgs/m/421-4212617_person-placeholder-image-transparent-hd-png-download.png',
                              height: 90,
                              width: 90,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(_controller.egresso.nome,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                                color: Color(0xFF547DD9),
                              ))),
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
                              color: Color(0xFF70D169)),
                          child: Text(
                            'Regular',
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
                      padding: EdgeInsets.only(bottom: 40),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 50.0,
                        color: Colors.white,
                        width: (MediaQuery.of(context).size.width),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 130.0,
                                color: Colors.white,
                                child: FlatButton(
                                    onPressed: () {
                                      _controller.setInformacoesEgresso(
                                          dadosGeraisView);
                                    },
                                    child: Text(
                                      "Dados Gerais",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.0,
                                        color: Color(0xFF547DD9),
                                      ),
                                    )),
                              ),
                              // Container(
                              //   width: 130.0,
                              //   color: Colors.white,
                              //   child: FlatButton(
                              //       onPressed: () {
                              //         _controller.setInformacoesEgresso(
                              //             producoesEgressoView);
                              //       },
                              //       child: Text(
                              //         "Produções",
                              //         style: TextStyle(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 13.0,
                              //           color: Color(0xFF547DD9),
                              //         ),
                              //       )),
                              // ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Observer(
                        builder: (_) => _controller.informacoesEgresso,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
