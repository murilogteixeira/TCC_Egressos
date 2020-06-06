import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tcc_egressos/components/dados_gerais_widget.dart';
import 'package:tcc_egressos/components/nav_bar_widget.dart';
import 'package:tcc_egressos/components/screenSize.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/model/curriculo_lattes/endereco.dart';
import 'package:tcc_egressos/model/curriculo_lattes/situacao.dart';
import 'package:tcc_egressos/model/route_argruments/curriculo_route_arguments.dart';

class CurriculoView extends StatefulWidget {
  static var route = "/curriculo";

  CurriculoView({Key key}) : super(key: key);

  final title = "Curriculo";
  @override
  _CurriculoViewState createState() => _CurriculoViewState();
}

class _CurriculoViewState extends State<CurriculoView> {
  double _maxWidth;
  BoxConstraints _constraints;
  ScreenSize _screenSize;
  CurriculoLattes _curriculo;

  @override
  Widget build(BuildContext context) {
    _curriculo = ModalRoute.of(context).settings.arguments;
    print(_curriculo);
    return LayoutBuilder(builder: (context, constraints) {
      _maxWidth = constraints.maxWidth;

      if (_maxWidth < 576) {
        _screenSize = ScreenSize.xs;
      } else if (_maxWidth >= 576 && _maxWidth < 768) {
        _screenSize = ScreenSize.sm;
      } else if (_maxWidth >= 768 && _maxWidth < 992) {
        _screenSize = ScreenSize.md;
      } else if (_maxWidth >= 992 && _maxWidth < 1200) {
        _screenSize = ScreenSize.lg;
      } else {
        _screenSize = ScreenSize.xl;
      }
      return Scaffold(appBar: _criarAppBar(), body: _body());
    });
  }

  _criarAppBar() {
    return kIsWeb
        ? null
        : AppBar(
            title: Text(widget.title ?? ""),
          );
  }

  Widget _body() {
    _cofigurarConstraints();
    return _mostrarCurriculo(CurriculoLattes());
  }

  _cofigurarConstraints() {
    switch (_screenSize) {
      case ScreenSize.xl:
        _constraints = BoxConstraints(maxWidth: 1140);
        break;
      case ScreenSize.lg:
        _constraints = BoxConstraints(maxWidth: 960);
        break;
      case ScreenSize.md:
        _constraints = BoxConstraints(maxWidth: 720);
        break;
      case ScreenSize.sm:
        _constraints = BoxConstraints(maxWidth: 540);
        break;
      case ScreenSize.xs:
        _constraints = BoxConstraints(maxWidth: _maxWidth - 20);
        break;
    }
  }

  _mostrarCurriculo(CurriculoLattes curriculo) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Color(0xFFEAEDF2),
          child: Column(
            children: [
              NavBarWidget(),

              // RESUMO
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(
                  constraints: _constraints,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    height: 302,
                    width: _maxWidth,
                    child: Column(
                      children: <Widget>[
                        Text(_curriculo.nome),
                      ],
                    ),
                  ),
                ),
              ),

              // DADOS
              Padding(
                padding: EdgeInsets.only(top: 57),
                child: Container(
                  constraints: _constraints,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  width: _maxWidth,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: _constraints.maxWidth * 0.9),
                        decoration: BoxDecoration(
                          color: Color(0xFF547DD9),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        height: 48,
                      ),
                      SizedBox(height: 67),
                      // DadosGeraisWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // _function(curriculo) {
  //   return [
  //     // SizedBox(height: 100),

  //     // Nome
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: <Widget>[
  //           Text(
  //             "Nome:",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 8),
  //             child: Text(
  //               curriculo.nome,
  //               style: TextStyle(fontSize: 20),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),

  //     // Lattes ID
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: <Widget>[
  //           Text(
  //             "Lattes ID:",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 8),
  //             child: Text(
  //               curriculo.lattesID,
  //               style: TextStyle(fontSize: 20),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),

  //     // Nome citação
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: <Widget>[
  //           Text(
  //             "Nome Citação:",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.only(left: 8),
  //               child: Text(
  //                 curriculo.nomeCitacao,
  //                 style: TextStyle(fontSize: 18),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),

  //     // Descricao
  //     Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Row(
  //         children: <Widget>[
  //           Text(
  //             "Descrição:",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.only(left: 8.0),
  //               child: Text(
  //                 curriculo.descricao,
  //                 style: TextStyle(fontSize: 18),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ];
  // }
}
