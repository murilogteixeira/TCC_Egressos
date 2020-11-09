import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:mobile/helpers/service/network.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../globals.dart';
part 'egressos_list.controller.g.dart';

class EgressosListController = _EgressosListControllerBase
    with _$EgressosListController;

abstract class _EgressosListControllerBase with Store {
  @observable
  ObservableList<Egresso> egressos = ObservableList<Egresso>();

  @observable
  ObservableList<Egresso> egressosFiltered = ObservableList<Egresso>();

  _EgressosListControllerBase() {
    fetchEgressos();
  }

  fetchEgressos() async {
    final url = 'https://egressosbackend.herokuapp.com/egressos/';

    List json = await Network().fetchData(url);
    if (json == null) return null;

    json.forEach((element) {
      var egresso = Egresso.fromJson(element);
      egressos.add(egresso);
      egressosFiltered.add(egresso);
    });
    egressos.sort((a, b) => a.nome.compareTo(b.nome));
    egressosFiltered.sort((a, b) => a.nome.compareTo(b.nome));

  }

  filter(String value) {
    value = value.toUpperCase();
    value = removeDiacritics(value);
    if (value.isEmpty) {
      egressos.forEach((e) {
        egressosFiltered.add(e);
      });
    } else {
      egressosFiltered.removeWhere((element) => true);
      egressos.forEach((e) {
        var nome = e.nome.toUpperCase();
        nome = removeDiacritics(nome);
        if (nome.contains(value)) egressosFiltered.add(e);
      });
    }
  }
}
