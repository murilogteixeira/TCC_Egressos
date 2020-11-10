import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:tcc_egressos/components/network.dart';
import 'package:tcc_egressos/model/curriculo_lattes/atuacao.dart';
import 'package:tcc_egressos/model/curriculo_lattes/cargo.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';

part 'egresso_controller.g.dart';

class EgressoController = _EgressoControllerBase with _$EgressoController;

abstract class _EgressoControllerBase with Store {
  @observable
  Egresso egresso;

  @action
  setEgresso(value) => egresso = value;

  @observable
  Widget container = Container();

  @action
  setContainer(value) => container = value;

  Future<List<Atuacao>> consultaAtuacao() async {
    final url =
        'https://egressosbackend.herokuapp.com/atuacoesProfissionais/?search=${egresso.id}';

    List json = await Network().fetchData(url);
    if (json == null) return null;
    List<Atuacao> atuacoes = [];
    atuacoes = json.map((e) => Atuacao.fromJson(e)).toList();

    return atuacoes;
  }

  Future<Cargo> consultaCargo() async {
    final response = await http.get(
      'https://egressosbackend.herokuapp.com/atuacoesProfissionais/?search=${egresso.id}',
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
