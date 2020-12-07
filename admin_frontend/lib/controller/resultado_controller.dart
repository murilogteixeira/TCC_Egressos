import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';
import 'package:tcc_egressos/view/curriculo_view.dart';
import 'package:tcc_egressos/view/list_egressos.dart';

part 'resultado_controller.g.dart';

class ResultadoController = _ResultadoControllerBase with _$ResultadoController;

abstract class _ResultadoControllerBase with Store {
  _ResultadoControllerBase(this.context);
  final context;

  @observable
  var paginaAtual = 0;

  @action
  setPaginaAtual(value) => paginaAtual = value;

  @observable
  // ObservableList<CurriculoLattes> lista = ObservableList();
  ObservableList<Egresso> lista = ObservableList();

  onTapCurriculo(CurriculoLattes curriculo) {
    _setCurriculo(curriculo);
    Navigator.pushNamed(context, CurriculoView.route, arguments: curriculo);
  }

  _setCurriculo(CurriculoLattes curriculo) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("curriculo", jsonEncode(curriculo.toJson()));
  }

  onTapEgresso(Egresso egresso) {
    _setEgresso(egresso);
    Navigator.pushNamed(context, CurriculoView.route, arguments: egresso);
  }

  _setEgresso(Egresso egresso) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("egresso", jsonEncode(egresso.toJson()));
  }
}

// class ResultadoController {
//   static ResultadoController _instance;
//   static getInstance(BuildContext context) {
//     if (_instance == null) {
//       return ResultadoController(context);
//     }
//     return _instance;
//   }

//   ResultadoController(this.context);
//   final context;

//   ObservableList<CurriculoLattes> lista = ObservableList();

//   onTapCurriculo(CurriculoLattes curriculo) {
//     _setCurriculo(curriculo);
//     Navigator.pushNamed(context, CurriculoView.route, arguments: curriculo);
//   }

//   _setCurriculo(CurriculoLattes curriculo) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setString("curriculo", jsonEncode(curriculo.toJson()));
//   }
// }
