import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile/model/curriculo_lattes/producao/producao.dart';

class ProducoesController {
  
  Future<List<Producao>> getProducoesEgresso(int id) async {
    final uri =
        'https://egressosbackend.herokuapp.com/producoesEgresso/?search=$id';

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = _decodeUTF8(response.bodyBytes);
      List json = jsonDecode(body);
      List<Producao> producoes = [];
      producoes = json.map((e) => Producao.fromJson(e)).toList();
      return producoes;
    } else {
      print('Erro ao buscar produções');
    }
    return null;
  }

  String _decodeUTF8(string) {
    return utf8.decode(string);
  }
  
}