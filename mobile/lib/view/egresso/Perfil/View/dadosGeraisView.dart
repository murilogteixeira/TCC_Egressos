import 'package:flutter/material.dart';

class DadosGeraisView extends StatefulWidget {
  const DadosGeraisView({Key key}) : super(key: key);

  // final List<Banca> bancas;
  // final List<int> mediaBancas;

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
                  child: Text('Nome de Citação:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'BRAGA FILHO, M. O.;DE OLIVEIRA BRAGA FILHO, MARIO',
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
                    child: Text('Conatos:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)))),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('braga@mail.com',
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
                child: Text('(61)9 9999-9999',
                    style: TextStyle(color: Colors.black, fontSize: 20.0))),
          ],
        ),
      ),
    );
  }
}
