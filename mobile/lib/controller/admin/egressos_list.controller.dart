import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mobile/main.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'egressos_list.controller.g.dart';

class EgressosListController = _EgressosListControllerBase
    with _$EgressosListController;

abstract class _EgressosListControllerBase with Store {
  @observable
  ObservableList<Egresso> egressos = ObservableList<Egresso>();

  _EgressosListControllerBase() {
    fetchEgressos();
  }

  fetchEgressos() async {
    final url = 'https://egressosbackend.herokuapp.com/egressos/';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      List json = jsonDecode(body);
      json.forEach((element) {
        var egresso = Egresso.fromJson(element);
        egressos.add(egresso);
      });
      egressos.sort((a, b) => a.nome.compareTo(b.nome));
    }
  }
}
