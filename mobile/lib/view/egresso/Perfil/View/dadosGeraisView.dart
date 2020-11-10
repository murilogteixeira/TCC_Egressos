import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/shared/perfil.controller.dart';

class DadosGeraisView extends StatefulWidget {
  const DadosGeraisView({Key key, this.controller}) : super(key: key);

  final PerfilController controller;
  @override
  _DadosGeraisViewState createState() => _DadosGeraisViewState();
}

class _DadosGeraisViewState extends State<DadosGeraisView> {
  Widget pointIndicator = new Container(
    width: 10,
    height: 10,
    decoration:
        new BoxDecoration(color: Color(0xFFB4AFED), shape: BoxShape.circle),
  );
  Widget horizontalSeparator = new Container(
    width: 363.23,
    height: 1,
    decoration:
        new BoxDecoration(color: Color(0xFFD1D1D1), shape: BoxShape.rectangle),
  );
  Widget verticalSeparator = new Container(
    width: 2,
    height: 32.25,
    decoration:
        new BoxDecoration(color: Color(0xFFEBEAF2), shape: BoxShape.rectangle),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        pointIndicator,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 9),
                                child: Text('ID Latters:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF547DD9),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                              ),
                              Text(widget.controller.egresso.idLattes,
                                  style: TextStyle(
                                      color: Color(0xFF4A4A4A), fontSize: 20.0))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 27, 40, 27),
                    child: horizontalSeparator,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        pointIndicator,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 9),
                                child: Text('Nome de Citação:',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF547DD9),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                              ),
                              Text(widget.controller.egresso.nomeCitacoes,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF4A4A4A),
                                      fontSize: 20.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 27, 40, 27),
                  //   child: horizontalSeparator,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       pointIndicator,
                  //       Padding(
                  //         padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(bottom: 9),
                  //               child: Text('Atuação:',
                  //                   style: TextStyle(
                  //                       color: Color(0xFF547DD9), fontWeight: FontWeight.bold, fontSize: 18.0)),
                  //             ),
                  //             Text('Docencia',
                  //                 style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 20.0))
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 27, 40, 27),
                  //   child: horizontalSeparator,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       pointIndicator,
                  //       Padding(
                  //         padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.only(bottom: 9),
                  //               child: Text('Cargo Atual:',
                  //                   style: TextStyle(
                  //                       color: Color(0xFF547DD9), fontWeight: FontWeight.bold, fontSize: 18.0)),
                  //             ),
                  //             Text('Professor Universitario',
                  //                 style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 20.0)),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 27, 40, 27),
                    child: horizontalSeparator,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(34, 8, 8, 9),
                          child: Text('Conatos:',
                              style: TextStyle(
                                  color: Color(0xFF547DD9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            pointIndicator,
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                              child: Text(widget.controller.egresso.email,
                                  style: TextStyle(
                                      color: Color(0xFF4A4A4A),
                                      fontSize: 20.0)),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 4),
                        //   child: verticalSeparator,
                        // ),
                        // Row(
                        //   children: [
                        //     pointIndicator,
                        //     Padding(
                        //       padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                        //       child: Text('Linkedin@mario-braga',
                        //           style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 20.0)),
                        //     ),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 4),
                        //   child: verticalSeparator,
                        // ),
                        // Row(
                        //   children: [
                        //     pointIndicator,
                        //     Padding(
                        //       padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                        //       child: Text('@mariobragaucb',
                        //           style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 20.0)),
                        //     ),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: verticalSeparator,
                        ),
                        Row(
                          children: [
                            pointIndicator,
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                              child: Text(
                                  widget.controller.egresso.celular ?? '',
                                  style: TextStyle(
                                      color: Color(0xFF4A4A4A),
                                      fontSize: 20.0)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}
