import 'package:flutter/material.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class CurriculoView extends StatefulWidget {
  static var route = "/curriculo";

  CurriculoView({Key key}) : super(key: key);

  @override
  _CurriculoViewState createState() => _CurriculoViewState();
}

class _CurriculoViewState extends State<CurriculoView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _mostrarCurriculo(CurriculoLattes()),
    );
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         "Artigos:",
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Column(
            //             children: curriculo.artigos.map((artigo) {
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Text(
            //                   artigo.nome,
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   DateFormat("dd/MM/yyyy HH:mm")
            //                       .format(artigo.dataPublicacao),
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   artigo.descricao,
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }).toList()),
            //       ),
            //     ],
            //   ),
            // ),

            //Eventos
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         "Eventos:",
            //         style: TextStyle(fontSize: 16),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Column(
            //             children: curriculo.eventos.map((evento) {
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Text(
            //                   evento.nome,
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   DateFormat("dd/MM/yyyy HH:mm")
            //                       .format(evento.data),
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   evento.descricao,
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }).toList()),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
