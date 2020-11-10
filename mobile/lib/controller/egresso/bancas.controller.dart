import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/helpers/service/network.dart';

import 'package:mobile/model/curriculo_lattes/banca/banca.dart';

import '../../globals.dart';

class BancasController {
  Future<List<Banca>> getBancasEgresso(int id) async {
    final url =
        'https://egressosbackend.herokuapp.com/bancasEgresso/?search=$id';

    List json = await Network().getApi(url);
    if (json == null) return null;
    List<Banca> bancas = [];
    bancas = json.map((e) => Banca.fromJson(e)).toList();
    return bancas;
  }
}
