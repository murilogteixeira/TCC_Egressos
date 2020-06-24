import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/controller/resultado_controller.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/view/list_egressos.dart';

class ResultadoView extends StatefulWidget {
  static var route = "/resultado";

  final String title = "Resultado";

  @override
  _ResultadoViewState createState() => _ResultadoViewState();
}

class _ResultadoViewState extends State<ResultadoView> {
  ResultadoController _controller;

  @override
  void initState() {
    _controller = ResultadoController.getInstance(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ObservableList<CurriculoLattes> args =
        ModalRoute.of(context).settings.arguments;
    if (args != null) {
      _controller.lista = args;
    }
    ObservableList<CurriculoLattes> lista = _controller.lista;

    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;

      if (maxWidth >= 576) {
        return Scaffold(
            appBar: _createAppBar(),
            body: _listContainer(lista)
        );
      }
      return Scaffold(
          appBar: _createAppBar(),
          body: _listContainer(lista)
      );
    });
  }

  _createAppBar() {
    if (kIsWeb) {
      return null;
    }
    return AppBar(
      title: Text(widget.title ?? ""),
    );
  }

  _listContainer(ObservableList<CurriculoLattes> lista) {
    if (lista == null) {
      return Text("Nenhum curriculo encontrado");
    }

    // return ListView.builder(
    //     itemCount: lista.length,
    //     itemBuilder: (context, index) {
    //       return CurriculoListaWidget(
    //         index: index + 1,
    //         curriculo: lista[index],
    //         onTapCurriculo: () {
    //           _controller.onTapCurriculo(lista[index]);
    //         },
    //       );
    //     });

    return Container(
      padding: EdgeInsets.fromLTRB(200, 200, 200, 0),
      color: Color(0xFFEAEDF2),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(50, 50, 0, 50),
                    child: Text(
                        '${lista.length} resultados encontrados',
                        style: TextStyle(color: Colors.blue, fontSize: 20.0)
                    )
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: ListEgressos(
                    list: lista,
                    sizeList: lista.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
