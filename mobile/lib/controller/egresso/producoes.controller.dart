import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile/model/curriculo_lattes/producao/producao.dart';

import '../../main.dart';

class ProducoesController {
  Future<List<Producao>> getProducoesEgresso(int id) async {
    final uri =
        'https://egressosbackend.herokuapp.com/producoesEgresso/?search=$id';

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      List json = jsonDecode(body);
      List<Producao> producoes = [];
      producoes = json.map((e) => Producao.fromJson(e)).toList();
      return producoes;
    } else {
      print('Erro ao buscar produções');
      print(decodeUTF8(response.bodyBytes));
    }
    return null;
  }

  Future<List<MediaProducao>> getListAvarages(int id) async {
    final uri = 'https://egressosbackend.herokuapp.com/graphType/$id';

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = decodeUTF8(response.bodyBytes);
      var json = jsonDecode(body);
      if (json['status'] == false) return null;
      List mediasJson = json['media'];
      List<MediaProducao> medias =
          mediasJson.map((e) => MediaProducao.fromJson(e)).toList();
      return medias;
    } else {
      print('Erro ao buscar produções');
    }
    return null;
  }

}

class MediaProducao {
  int media;
  int egresso;
  String tipo;
  int tipoId;

  MediaProducao({this.media, this.egresso, this.tipo, this.tipoId});

  MediaProducao.fromJson(Map<String, dynamic> json) {
    media = json['media'];
    egresso = json['egresso'];
    tipo = json['tipo'];
    tipoId = json['tipo_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media'] = this.media;
    data['egresso'] = this.egresso;
    data['tipo'] = this.tipo;
    data['tipo_id'] = this.tipoId;
    return data;
  }
}
