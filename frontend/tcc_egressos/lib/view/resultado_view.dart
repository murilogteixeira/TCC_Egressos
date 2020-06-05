import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';

class ResultadoView extends StatefulWidget {
  static var route = "/resultado";

  final String title;

  ResultadoView({this.title});

  @override
  _ResultadoViewState createState() => _ResultadoViewState();
}

class _ResultadoViewState extends State<ResultadoView> {
  @override
  Widget build(BuildContext context) {
    final ObservableList<CurriculoLattes> lista =
        ModalRoute.of(context).settings.arguments;

    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;

      if (maxWidth >= 576) {
        return Scaffold(appBar: _createAppBar(), body: _listContainer(lista));
      }
      return Scaffold(appBar: _createAppBar(), body: _listContainer(lista));
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
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index].nome),
          );
        });
  }
}
