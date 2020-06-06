import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/view/curriculo_view.dart';

class ResultadoController {
  static ResultadoController _instance;
  static getInstance(BuildContext context) {
    if (_instance == null) {
      return ResultadoController(context);
    }
    return _instance;
  }

  ResultadoController(this.context);
  final context;

  ObservableList<CurriculoLattes> lista = ObservableList();

  onTapCurriculo(CurriculoLattes curriculo) {
    Navigator.pushNamed(context, CurriculoView.route, arguments: curriculo);
  }
}
