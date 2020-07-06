import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/components/nav_bar_widget.dart';
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
  ObservableList<ObservableList<CurriculoLattes>> matriz;
  

  @override
  void initState() {
    _controller = ResultadoController(context);
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
            backgroundColor: Color(0xFFEAEDF2),
            body: _listContainer(lista));
      }
      return Scaffold(appBar: _createAppBar(), body: _listContainer(lista));
    });
  }

  ObservableList<ObservableList<CurriculoLattes>> _buildPages(
      int nroPages, int nroRegister, ObservableList<CurriculoLattes> lista) {
    ObservableList<ObservableList<CurriculoLattes>> aux =
        new ObservableList<ObservableList<CurriculoLattes>>();
    int k = 0;

    if (nroPages < 1){
      nroPages = 1;
    }

    print(nroPages);
    for (int i = 0; i < nroPages; i++) {
      aux.add(new ObservableList<CurriculoLattes>());
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
        padding: EdgeInsets.all(20),
        child: FlatButton(
          onPressed: () {
            print('oi');
            _controller.setPaginaAtual(i);
          },
          child: Text('${i + 1}'),
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: aux,
    );
  }

  ListEgressos _selecionarLista() {
    return ListEgressos(
      list: matriz[_controller.paginaAtual],
      sizeList: matriz[_controller.paginaAtual].length,
    );
  }

  _createAppBar() {
    return kIsWeb
        ? null
        : AppBar(
            title: Text(widget.title ?? ""),
          );
  }

  _listContainer(ObservableList<CurriculoLattes> lista) {
    if (lista == null) {
      return Text("Nenhum curriculo encontrado");
    }
    print((lista.length / 6).round());
    matriz = _buildPages((lista.length/4).round(), 4, lista);
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
                          child: Text(
                              '${matriz[0].length} resultados encontrados',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 20.0))),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20),
                        child: _buildIndexPage((lista.length/4).round()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Observer(builder: (_){
                          return _selecionarLista();
                        }),
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
