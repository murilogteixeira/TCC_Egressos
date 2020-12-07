import 'package:mobile/model/curriculo_lattes/banca/banca.dart';
import 'package:mobile/model/curriculo_lattes/producao/producao.dart';

import 'situacao.dart';

class Egresso {
  int id;
  String idLattes;
  String nome;
  String nomeCitacoes;
  String celular;
  String email;
  Situacao situacao;
  String linkedin;
  String instagram;
  String idOrcid;
  String cargoAtual;
  String atuacao;
  String empresa;
  List<Producao> producoes;
  List<Banca> bancas;

  Egresso({
    this.id,
    this.idLattes,
    this.nome,
    this.nomeCitacoes,
    this.celular,
    this.email,
    this.situacao,
    this.linkedin,
    this.instagram,
    this.idOrcid,
    this.cargoAtual,
    this.empresa,
    this.atuacao,
    this.producoes,
  });

  Egresso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLattes = json['idLattes'];
    nome = json['nome'];
    nomeCitacoes = json['nomeCitacoes'];
    celular = json['celular'];
    email = json['email'];
    situacao = json['situacao'] != null
        ? new Situacao.fromJson(json['situacao'])
        : "null";
    linkedin = json['linkedin'];
    instagram = json['instagram'];
    idOrcid = json['idOrcid'];
    cargoAtual = json['cargoAtual'];
    atuacao = json['atuacao'];
    empresa = json['empresa'];
    if (json['producoes'] != null) {
      producoes = new List<Producao>();
      json['producoes'].forEach((v) {
        producoes.add(new Producao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idLattes'] = this.idLattes;
    data['nome'] = this.nome;
    data['nomeCitacoes'] = this.nomeCitacoes;
    data['celular'] = this.celular;
    data['email'] = this.email;
    if (this.situacao != null) {
      data['situacao'] = this.situacao.toJson();
    }
    data['linkedin'] = this.linkedin;
    data['instagram'] = this.instagram;
    data['idOrcid'] = this.idOrcid;
    data['cargoAtual'] = this.cargoAtual;
    data['atuacao'] = this.atuacao;
    data['empresa'] = this.empresa;
    if (this.producoes != null) {
      data['producoes'] = this.producoes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
