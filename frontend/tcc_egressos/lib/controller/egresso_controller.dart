import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tcc_egressos/components/network.dart';
import 'package:tcc_egressos/controller/producoes_controller.dart';
import 'package:tcc_egressos/model/curriculo_lattes/banca/banca.dart';
import 'package:tcc_egressos/model/curriculo_lattes/cargo.dart';
import 'package:tcc_egressos/model/curriculo_lattes/egresso.dart';
import 'package:tcc_egressos/model/curriculo_lattes/producao/producao.dart';

part 'egresso_controller.g.dart';

class EgressoController = _EgressoControllerBase with _$EgressoController;

abstract class _EgressoControllerBase with Store {
  @observable
  Egresso egresso;

  _EgressoControllerBase({this.egresso}) {
    // obterProducoes();
    // obterMediaProducoes();
  }

  @action
  setEgresso(value) => egresso = value;

  @observable
  Widget container = Container();

  @action
  setContainer(value) => container = value;

  @observable
  ObservableList<Producao> producoes = <Producao>[].asObservable();

  @observable
  ObservableList<MediaProducao> mediaProducoes =
      <MediaProducao>[].asObservable();

  ObservableList<Banca> bancas = <Banca>[].asObservable();
  ObservableList<int> mediaBancas = <int>[].asObservable();

  // Future<List<Atuacao>> consultaAtuacao() async {
  //   final url =
  //       'https://egressosbackend.herokuapp.com/atuacoesProfissionais/?search=${egresso.id}';

  //   List json = await Network().fetchData(url);
  //   if (json == null) return null;
  //   List<Atuacao> atuacoes = [];
  //   atuacoes = json.map((e) => Atuacao.fromJson(e)).toList();

  //   return atuacoes;
  // }

  Future<Cargo> consultaCargo() async {
    final url =
        'https://egressosbackend.herokuapp.com/atuacoesProfissionais/?search=${egresso.id}';

    List json = await Network().fetchData(url);
    if (json == null) return null;

    var formacaoList = json.map((e) {
      return Cargo().fromJson(e);
    }).toList();

    var cargoAtual = formacaoList.first;

    return cargoAtual;
  }

  obterProducoes() async {
    var producoesController = ProducoesController();
    List<Producao> _producoes =
        await producoesController.getProducoesEgresso(egresso.id);
    _producoes.forEach((element) {
      producoes.add(element);
    });
  }

  obterMediaProducoes() async {
    var producoesController = ProducoesController();
    List<MediaProducao> _medias =
        await producoesController.getListAvarages(egresso.id);
    _medias.forEach((element) {
      mediaProducoes.add(element);
    });
  }

  ObservableList<MediaProducao> getMediaProducoes() {
    return this.mediaProducoes;
  }
}
