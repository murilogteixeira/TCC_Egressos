import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/cargo.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:http/http.dart' as http;
import 'package:tcc_egressos/model/curriculo_lattes/atuacao.dart';

part 'curriculo_controller.g.dart';

class CurriculoController = _CurriculoControllerBase with _$CurriculoController;

abstract class _CurriculoControllerBase with Store {
  // @observable
  // ObservableList<Widget> listaWidget = ObservableList();

  @observable
  CurriculoLattes curriculo;
  @action
  setCurriculo(value) => curriculo = value;

  @observable
  Widget container = Container();

  @action
  setContainer(value) => container = value;

  Future<List<Atuacao>> consultaAtuacao() async {
    final response = await http.get(
      'https://egressosbackend.herokuapp.com/atuacoesProfissionais/?search=${curriculo.id}',
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    var body = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {
      List responseJson = json.decode(body);
      var formacaoList = responseJson.map((e) {
        return Atuacao().fromJson(e);
      }).toList();

      return formacaoList;
    }
    // doneCallback();
    return null;
  }

  Future<Cargo> consultaCargo() async {
    final response = await http.get(
      'https://egressosbackend.herokuapp.com/atuacoesProfissionais/?search=${curriculo.id}',
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    var body = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {
      List responseJson = json.decode(body);
      var formacaoList = responseJson.map((e) {
        return Cargo().fromJson(e);
      }).toList();

      var cargoAtual = formacaoList.first;

      return cargoAtual;
    }
    // doneCallback();
    return null;
  }
}
