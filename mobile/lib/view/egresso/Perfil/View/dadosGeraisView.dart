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
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  pointIndicator,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: Text('ID Lattes:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xFF547DD9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                        ),
                        Text(
                            widget.controller.egresso.idLattes ??
                                'Não informado',
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
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  pointIndicator,
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
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
                          Text(
                              widget.controller.egresso.nomeCitacoes ??
                                  'Não informado',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xFF4A4A4A), fontSize: 20.0)),
                        ],
                      ),
                    ),
                  )
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
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.controller.egresso.email == null ||
                          widget.controller.egresso.email == ''
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(34, 0, 8, 0),
                          child: Text('Contatos:',
                              style: TextStyle(
                                  color: Color(0xFF547DD9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0)),
                        ),
                  widget.controller.egresso.email == null ||
                          widget.controller.egresso.email == ""
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            pointIndicator,
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 50,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                                child: Text(widget.controller.egresso.email,
                                    style: TextStyle(
                                        color: Color(0xFF4A4A4A),
                                        fontSize: 20.0)),
                              ),
                            ),
                          ],
                        ),
                  widget.controller.egresso.linkedin == null ||
                          widget.controller.egresso.linkedin == ''
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: verticalSeparator,
                        ),
                  widget.controller.egresso.linkedin == null ||
                          widget.controller.egresso.linkedin == ''
                      ? Container()
                      : Row(
                          children: [
                            pointIndicator,
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 50,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                                child: Text(widget.controller.egresso.linkedin,
                                    style: TextStyle(
                                        color: Color(0xFF4A4A4A),
                                        fontSize: 20.0)),
                              ),
                            ),
                          ],
                        ),
                  widget.controller.egresso.instagram == null ||
                          widget.controller.egresso.instagram == ''
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: verticalSeparator,
                        ),
                  widget.controller.egresso.instagram == null ||
                          widget.controller.egresso.instagram == ''
                      ? Container()
                      : Row(
                          children: [
                            pointIndicator,
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 50,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                                child: Text(widget.controller.egresso.instagram,
                                    style: TextStyle(
                                        color: Color(0xFF4A4A4A),
                                        fontSize: 20.0)),
                              ),
                            ),
                          ],
                        ),
                  widget.controller.egresso.celular == null ||
                          widget.controller.egresso.celular == ''
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: verticalSeparator,
                        ),
                  widget.controller.egresso.celular == null ||
                          widget.controller.egresso.celular == ''
                      ? Container()
                      : Row(
                          children: [
                            pointIndicator,
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 50,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                                child: Text(widget.controller.egresso.celular,
                                    style: TextStyle(
                                        color: Color(0xFF4A4A4A),
                                        fontSize: 20.0)),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
