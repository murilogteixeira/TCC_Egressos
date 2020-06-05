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
  // Future<CurriculoLattes> curriculoLattes;
  // Future<String> curriculoLattesStr;

  // Future<CurriculoLattes> _getCurriculo() async {
  //   curriculoLattesStr = _getCurriculoStr();
  //   return curriculoLattesStr
  //       .then((value) => CurriculoLattes().fromJson(json.decode(value)));
  // }

  // Future<String> _getCurriculoStr() async {
  //   return await SharedPreferences.getInstance()
  //       .then((value) => value.getString("curriculoLattes"));
  // }

  @override
  Widget build(BuildContext context) {
    final ObservableList<CurriculoLattes> lista = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Nome: ${lista[index].nome}"),
            );
          }),
    );
    // curriculoLattes = _getCurriculo();
    // return FutureBuilder(
    //     future: curriculoLattes,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return Scaffold(
    //             appBar: kIsWeb
    //                 ? null
    //                 : AppBar(
    //                     title: Text(widget.title ?? ""),
    //                   ),
    //             body: Text("asdf"));
    //       }
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text("Resultado"),
    //         ),
    //         body: Text("Não encontrado"),
    //       );
    //     });
  }
}
