import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/helpers/service/network.dart';

import 'package:mobile/model/curriculo_lattes/producao/producao.dart';

import '../../globals.dart';

class ProducoesController {
  Future<List<Producao>> getProducoesEgresso(int id) async {
    final url =
        'https://egressosbackend.herokuapp.com/producoesEgresso/?search=$id';

    List json = await Network().getApi(url);
    if (json == null) return null;
    List<Producao> producoes = [];
    producoes = json.map((e) => Producao.fromJson(e)).toList();
    return producoes;
  }

  Future<List<MediaProducao>> getListAvarages(int id) async {
    final url = 'https://egressosbackend.herokuapp.com/graphType/$id';

    var json = await Network().getApi(url);
    if (json == null) return null;
    if (json['status'] == false) return null;
    List mediasJson = json['media'];
    List<MediaProducao> medias =
        mediasJson.map((e) => MediaProducao.fromJson(e)).toList();
    return medias;
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
