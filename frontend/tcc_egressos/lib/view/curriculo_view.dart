import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/components/menu_botao_widget.dart';
import 'package:tcc_egressos/components/nav_bar_widget.dart';
import 'package:tcc_egressos/components/screenSize.dart';
import 'package:tcc_egressos/controller/curriculo_controller.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

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
  CurriculoController _controller;

  @override
  void initState() {
    _controller = CurriculoController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var curriculo = ModalRoute.of(context).settings.arguments;
    if (curriculo != null) {
      _curriculo = curriculo;
    }

    _getCurriculo();

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

  _getCurriculo() async {
    var prefs = await SharedPreferences.getInstance();
    var json = prefs.getString("curriculo");
    _curriculo = CurriculoLattes().fromJson(jsonDecode(json));
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
    return _mostrarLayout();
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

  Widget _foto() {
    return Container(
      // color: Colors.green,
      width: 90,
      height: 90,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage("https://picsum.photos/250"),
        ),
      ),
    );
  }

  Widget _nomeStatus() {
    var nome = Text(
      _curriculo.nome,
      style: TextStyle(fontSize: 22),
    );
    var status = Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Container(
        width: 198,
        height: 31,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Text(
          "${_curriculo.situacao.tipo}",
          style: TextStyle(fontSize: 14, color: Color(0xFFFDFDFD)),
        )),
      ),
    );
    var row = Row(
      children: <Widget>[nome, status],
    );
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[nome, status],
    );
    if (_screenSize == ScreenSize.lg ||
        _screenSize == ScreenSize.md ||
        _screenSize == ScreenSize.xl) {
      return row;
    } else {
      return column;
    }
  }

  Widget _formacaoCargo() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        constraints: BoxConstraints(maxWidth: _constraints.maxWidth * 0.8),
        // color: Colors.blue,
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dictum dui risus, vitae maximus enim pretium eu. Nunc feugiat urna ut massa ultricies, at vehicula eros pellentesque. Suspendisse molestie ipsum in vulputate scelerisque. Sed lacinia, dui nec elementum iaculis, lectus est hendrerit quam, in egestas purus orci eu arcu.",
        ),
      ),
    );
  }

  Widget _descricao() {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Container(
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dictum dui risus, vitae maximus enim pretium eu. Nunc feugiat urna ut massa ultricies, at vehicula eros pellentesque. Suspendisse molestie ipsum in vulputate scelerisque. Sed lacinia, dui nec elementum iaculis, lectus est hendrerit quam, in egestas purus orci eu arcu. Maecenas tortor risus, ultrices vel aliquet vel, rutrum eu orci. Sed dui risus, dapibus accumsan tristique ut, congue in turpis. In ultricies euismod libero nec commodo. Etiam ac mollis est, quis pharetra arcu. Mauris quis nisl ante. Donec eu ex a ex tincidunt accumsan. Cras lacinia lacus ut turpis posuere varius. Mauris viverra arcu purus, eget fringilla libero dapibus nec. Ut maximus blandit auctor. Nulla dapibus, turpis vitae lobortis feugiat, metus nibh rutrum purus, id condimentum quam turpis et ex. Proin sit amet iaculis justo. Phasellus id nulla et purus consequat vulputate et ut turpis. Vivamus congue pellentesque viverra. Aliquam ut posuere erat. Quisque vitae scelerisque mi. Duis lacinia lorem vitae rhoncus gravida. Quisque tempor nulla ac purus condimentum consectetur. Duis eget bibendum orci. Curabitur facilisis ante sit amet arcu pellentesque interdum. Suspendisse potenti. Aliquam erat volutpat. Morbi ac ultrices ipsum. Nullam id turpis quis mi accumsan placerat. Morbi ut sem nec lectus finibus consequat. Donec sit amet tempor risus, ut consequat leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi diam ligula, cursus vitae consectetur eget, facilisis nec orci.",
        ),
      ),
    );
  }

  _mostrarLayout() {
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
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 48, bottom: 25, left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: [
                          _foto(),
                          Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _nomeStatus(),
                                  _formacaoCargo(),
                                ]),
                          ),
                        ]),
                        _descricao(),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MenuBotaoWidget(
                              onTap: () => print("Dados Gerais"),
                              text: "Dados Gerais",
                            ),
                            MenuBotaoWidget(
                              onTap: () => print("Formação"),
                              text: "Formação",
                            ),
                            MenuBotaoWidget(
                              onTap: () => print("Atuação"),
                              text: "Atuação",
                            ),
                            MenuBotaoWidget(
                              onTap: _alterarContainer,
                              text: "Produções",
                            ),
                            MenuBotaoWidget(
                              onTap: () => print("Eventos"),
                              text: "Eventos",
                            ),
                            MenuBotaoWidget(
                              onTap: () => print("Bancas"),
                              text: "Bancas",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Observer(
                          builder: (_) {
                            return _controller.container;
                          },
                        ),
                      ),
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

  _alterarContainer() {
      var r = Random();
    _controller.container = Container(
      color: Color.fromRGBO(r.nextInt(255), r.nextInt(255), r.nextInt(255), 1),
      height: 50,
    );
  }
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
