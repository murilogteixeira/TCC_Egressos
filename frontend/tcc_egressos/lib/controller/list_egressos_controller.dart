import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/view/curriculo_view.dart';


class ListEgressosController{
  static ListEgressosController _instance;
  static getInstance(BuildContext context) {
    if (_instance == null) {
      return ListEgressosController(context);
    }
    return _instance;
  }

  ListEgressosController(this.context);
  final context;

  ObservableList<CurriculoLattes> lista = ObservableList();

  onTapCurriculo(CurriculoLattes curriculo) {
    _setCurriculo(curriculo);
    Navigator.pushNamed(context, CurriculoView.route, arguments: curriculo);
  }

  _setCurriculo(CurriculoLattes curriculo) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("curriculo", jsonEncode(curriculo.toJson()));
  }
}
