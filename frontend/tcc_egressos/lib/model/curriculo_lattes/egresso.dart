import 'package:tcc_egressos/model/curriculo_lattes/producao/producao.dart';

import 'banca/banca.dart';
import 'endereco.dart';
import 'situacao.dart';

class Egresso {
  int id;
  String idLattes;
  String nome;
  String dNasc;
  String nomeCitacoes;
  String celular;
  String email;
  Endereco endereco;
  Situacao situacao;
  List<Producao> producoes;
  List<Banca> bancas;

  Egresso({
    this.id,
    this.idLattes,
    this.nome,
    this.dNasc,
    this.nomeCitacoes,
    this.celular,
    this.email,
    this.endereco,
    this.situacao,
    this.producoes,
    this.bancas,
  });

  Egresso.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLattes = json['idLattes'];
    nome = json['nome'];
    dNasc = json['d_nasc'];
    nomeCitacoes = json['nomeCitacoes'];
    celular = json['celular'];
    email = json['email'];
    // endereco = json['endereco'] != null
    // ? new Endereco.fromJson(json['endereco'])
    // : null;
    // situacao = json['situacao'] != null
    //     ? new Situacao.fromJson(json['situacao'])
    //     : null;
    if (json['producoes'] != null) {
      producoes = new List<Producao>();
      json['producoes'].forEach((v) {
        producoes.add(new Producao.fromJson(v));
      });
    }
    if (json['bancas'] != null) {
      bancas = new List<Banca>();
      json['bancas'].forEach((v) {
        bancas.add(new Banca.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idLattes'] = this.idLattes;
    data['nome'] = this.nome;
    data['d_nasc'] = this.dNasc;
    data['nomeCitacoes'] = this.nomeCitacoes;
    data['celular'] = this.celular;
    data['email'] = this.email;
    if (this.endereco != null) {
      data['endereco'] = this.endereco.toJson();
    }
    if (this.situacao != null) {
      data['situacao'] = this.situacao.toJson();
    }
    if (this.producoes != null) {
      data['producoes'] = this.producoes.map((v) => v.toJson()).toList();
    }
    if (this.bancas != null) {
      data['bancas'] = this.bancas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
