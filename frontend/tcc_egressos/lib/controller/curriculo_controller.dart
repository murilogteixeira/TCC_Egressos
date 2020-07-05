import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/model/curriculo_lattes/curriculo_lattes.dart';
import 'package:http/http.dart' as http;
import 'package:tcc_egressos/model/curriculo_lattes/formacaoAcademica.dart';

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

  Future<List<FormacaoAcademica>> consultaFormacao() async {
    final response = await http.get(
        'https://egressosbackend.herokuapp.com/formacoesAcademicas/?search=${curriculo.id}',
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a'
        });

    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      var formacaoList = responseJson.map((e) {
        return FormacaoAcademica().fromJson(e);
      }).toList();

      return formacaoList;
    }
    // doneCallback();
    return null;
  }
}
