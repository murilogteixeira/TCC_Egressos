import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile/model/curriculo_lattes/banca/banca.dart';

import '../../main.dart';

class BancasController {

  Future<List<Banca>> getBancasEgresso(int id) async {
    final uri =
        'https://egressosbackend.herokuapp.com/bancasEgresso/?search=$id';

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      List json = jsonDecode(body);
      List<Banca> bancas = [];
      bancas = json.map((e) => Banca.fromJson(e)).toList();
      return bancas;
    } else {
      print('Erro ao buscar produções');
    }
    return null;
  }
  
}