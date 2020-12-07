import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/controller/producoes_controller.dart';
import 'package:tcc_egressos/model/curriculo_lattes/banca/banca.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';
import 'package:tcc_egressos/model/curriculo_lattes/producao/producao.dart';
import 'package:tcc_egressos/view/resultado_view.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase(this.context);
  final context;

  // @observable
  // var lista = ObservableList<CurriculoLattes>();

  @observable
  var lista = ObservableList<Egresso>();

  @observable
  ObservableList<Producao> producoes = <Producao>[].asObservable();

  @observable
  ObservableList<MediaProducao> mediaProducoes =
      <MediaProducao>[].asObservable();

  @observable
  ObservableList<Banca> bancas = <Banca>[].asObservable();

  @observable
  ObservableList<int> mediaBancas = <int>[].asObservable();

  @action
  consultar(String nome, doneCallback) async {
    final response = await http.get(
      'https://egressosbackend.herokuapp.com/egressos/?search=$nome',
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    var body = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {
      List responseJson = json.decode(body);

      lista = ObservableList<Egresso>();
      responseJson.forEach((json) {
        lista.add(Egresso.fromJson(json));
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
    final response = await http.get(
      'https://egressosbackend.herokuapp.com/egressos',
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    var body = _decodeUTF8(response.bodyBytes);

    if (response.statusCode == 200) {
      List responseJson = json.decode(body);

      lista = ObservableList<Egresso>();
      responseJson.forEach((element) {
        lista.add(Egresso.fromJson(element));
      });

      if (lista.isNotEmpty) {
        doneCallback();
        Navigator.pushNamed(context, ResultadoView.route, arguments: lista);
      }
    }
    doneCallback();
  }

  @action
  addEgresso(Egresso egresso) {
    lista.add(egresso);
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
    var lista = ObservableList<Egresso>();
    if (listaString != null) {
      listaString
          .map((e) => lista.add(Egresso.fromJson(jsonDecode(e))))
          .toList();
    }
    this.lista = lista;
  }

  @action
  obterProducoes(int id) async {
    var producoesController = ProducoesController();
    List<Producao> _producoes =
        await producoesController.getProducoesEgresso(id);
    _producoes.forEach((element) {
      producoes.add(element);
    });
  }

  @action
  obterMedia(int id) async {
    var producoesController = ProducoesController();
    List<MediaProducao> _medias = await producoesController.getListAvarages(id);
    _medias.forEach((element) {
      mediaProducoes.add(element);
    });
  }

  Future<ObservableList<Egresso>> getEgressos() async {
    final response = await http.get(
      'https://egressosbackend.herokuapp.com/egressos',
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 684bd25e2c3387ad980e732e52ab390897d8339a',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      var body = _decodeUTF8(response.bodyBytes);
      List responseJson = json.decode(body);

      lista = ObservableList();
      responseJson.forEach((element) {
        lista.add(Egresso.fromJson(element));
      });

      if (lista.isNotEmpty) {
        return Future.value(lista);
      }
    } else {
      print('Erro ao buscar os egressos');
    }
    return null;
  }

  String _decodeUTF8(string) {
    return utf8.decode(string);
  }
}
