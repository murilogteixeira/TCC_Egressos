import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:tcc_egressos/view/resultado_view.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase(this.context);

  final context;

  @observable
  var lista = ObservableList<CurriculoLattes>();

  @action
  consultar(String nome, doneCallback) async {
    final response = await http.get(
        'https://egressosbackend.herokuapp.com/egressos/?search=$nome',
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a'
        });

    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      lista = ObservableList();
      responseJson.forEach((json) {
        lista.add(CurriculoLattes().fromJson(json));
      });
      if (lista.isNotEmpty) {
        doneCallback();
        Navigator.pushNamed(context, ResultadoView.route, arguments: lista);
      }
    }
    doneCallback();
  }

  @action
  buscarTodos(doneCallback) async {
    final response = await http
        .get('https://egressosbackend.herokuapp.com/egressos', headers: {
      HttpHeaders.authorizationHeader:
          'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a'
    });

    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      lista = ObservableList();
      responseJson.forEach((json) {
        lista.add(CurriculoLattes().fromJson(json));
      });
      if (lista.isNotEmpty) {
        doneCallback();
        Navigator.pushNamed(context, ResultadoView.route, arguments: lista);
      }
    }
    doneCallback();
  }

  @action
  addCurriculo(CurriculoLattes curriculo) {
    lista.add(curriculo);
  }

  salvarListaSP() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        "lista", lista.map((e) => jsonEncode(e.toJson())).toList());
  }

  @action
  obterListaSP() async {
    var prefs = await SharedPreferences.getInstance();
    var listaString = prefs.getStringList("lista");
    var lista = ObservableList<CurriculoLattes>();
    if (listaString != null) {
      listaString
          .map((e) => lista.add(CurriculoLattes().fromJson(jsonDecode(e))))
          .toList();
    }
    this.lista = lista;
  }
}
