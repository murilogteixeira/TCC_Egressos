import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/components/nav_bar_widget.dart';
import 'package:tcc_egressos/controller/resultado_controller.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';
import 'package:tcc_egressos/view/list_egressos.dart';

class ResultadoView extends StatefulWidget {
  static var route = "/resultado";

  final String title = "Resultado";

  @override
  _ResultadoViewState createState() => _ResultadoViewState();
}

class _ResultadoViewState extends State<ResultadoView> {
  ResultadoController _controller;
  ObservableList<ObservableList<Egresso>> matriz;

  @override
  void initState() {
    _controller = ResultadoController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ObservableList<Egresso> args = ModalRoute.of(context).settings.arguments;
    if (args != null) {
      _controller.lista = args;
    }

    ObservableList<Egresso> lista = _controller.lista;
    lista = lista.toSet().toList().asObservable();
    lista = this._removeDuplicates(lista);

    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;
      if (maxWidth >= 576) {
        return Scaffold(
            appBar: _createAppBar(),
            backgroundColor: Color(0xFFEAEDF2),
            body: _listContainer(lista));
      }
      return Scaffold(appBar: _createAppBar(), body: _listContainer(lista));
    });
  }

  ObservableList<Egresso> _removeDuplicates(ObservableList<Egresso> list) {
    var ids = list.map((element) => element.id).toSet();
    var newList = list;
    newList.retainWhere((element) => ids.remove(element.id));
    return newList;
  }

  ObservableList<ObservableList<Egresso>> _buildPages(
      int nroPages, int nroRegister, ObservableList<Egresso> lista) {
    ObservableList<ObservableList<Egresso>> aux =
        new ObservableList<ObservableList<Egresso>>();
    int k = 0;

    if (nroPages < 1) {
      nroPages = 1;
    }

    for (int i = 0; i < nroPages; i++) {
      aux.add(new ObservableList<Egresso>());
      /*
        Verifica se o numero de register nao e maior que o numero de egressos
        restantes na lita, caso seja ele apresenta os que sobraram.
      */
      if (lista.length - (i * nroRegister) < nroRegister) {
        for (int j = 0; j < lista.length - (i * nroRegister); j++) {
          aux[i].add(lista[k]);
          k++;
        }
      } else {
        for (int j = 0; j < nroRegister; j++) {
          aux[i].add(lista[k]);
          k++;
        }
      }
    }
    return aux;
  }

  Widget _buildIndexPage(int nroPages) {
    List<Widget> aux = new List<Widget>();
    for (int i = 0; i < nroPages; i++) {
      aux.add(Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.fromLTRB(
            i == 0 ? 0 : 1.0, 0, i == nroPages - 1 ? 1.0 : 0, 0),
        child: FlatButton(
          padding: EdgeInsets.zero,
          textColor: Colors.black,
          shape: new CircleBorder(),
          onPressed: () {
            _controller.setPaginaAtual(i);
          },
          child: Text('${i + 1}'),
        ),
      ));
    }

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: aux,
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: aux,
            ),
          ),
        ),
      ],
    );
  }

  ListEgressos _selecionarLista(ObservableList<Egresso> lista) {
    return ListEgressos(
      egressos: matriz[_controller.paginaAtual],
      sizeList: matriz[_controller.paginaAtual].length,
    );
    // print("\n\n\n\n\n lenght: " + matriz.length.toString());
    // print("lista: " + matriz.toString() + "\n\n\n\n\n");
    // return ListEgressos(
    //   egressos: lista,
    //   sizeList: lista.length,
    // );
  }

  _createAppBar() {
    return kIsWeb
        ? null
        : AppBar(
            title: Text(widget.title ?? ""),
          );
  }

  _listContainer(ObservableList<Egresso> lista) {
    if (lista == null) {
      return Text("Nenhum egresso encontrado");
    }
    // print("\n\n\n\n\n lenght: " + lista.length.toString() + "\n\n\n\n\n");
    matriz = _buildPages((lista.length / 8).round(), 8, lista);
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFEAEDF2),
        child: Column(
          children: <Widget>[
            NavBarWidget(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
              child: Container(
                width: 740,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text('${lista.length} resultados encontrados',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0))),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20),
                        child: _buildIndexPage((lista.length / 8).round()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Observer(builder: (_) {
                          return _selecionarLista(lista);
                        }),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20),
                        child: _buildIndexPage((lista.length / 8).round()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
