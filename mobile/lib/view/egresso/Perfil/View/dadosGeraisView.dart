import 'package:flutter/material.dart';
import 'package:mobile/controller/perfil.controller.dart';

class DadosGeraisView extends StatefulWidget {
  const DadosGeraisView({Key key, this.controller}) : super(key: key);

  final PerfilController controller;

  @override
  _DadosGeraisViewState createState() => _DadosGeraisViewState();
}

class _DadosGeraisViewState extends State<DadosGeraisView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
              Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ID Latters:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      widget.controller.egresso.idLattes,
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Nome de Citação:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      widget.controller.egresso.nomeCitacoes,
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Atuação:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Docencia',
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Cargo Atual:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Professor Universitario',
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Contatos:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)))),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.controller.egresso.email,
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Linkedin@mario-braga',
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('@mariobragaucb',
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.controller.egresso.celular ?? '',
                    style: TextStyle(color: Colors.black, fontSize: 20.0))),
          ],
        ),
      ),
    );
  }
}
