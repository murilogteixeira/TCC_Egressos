import 'package:tcc_egressos/model/artigo.dart';
import 'package:tcc_egressos/model/evento.dart';

class CurriculoLattes {
  final String lattesID;
  final String nome;
  final String nomeCitacao;
  final String descricao;
  final List<Evento> eventos;
  final List<Artigo> artigos;

  CurriculoLattes(
      {this.lattesID,
      this.nome,
      this.descricao,
      this.nomeCitacao,
      this.eventos,
      this.artigos});

  factory CurriculoLattes.fromJson(Map<String, dynamic> json) {
    if (json["profile"] != null) {
      var profile = json["profile"];
      return CurriculoLattes(
        lattesID: profile["idLattes"],
        nome: profile["nome"],
        descricao: profile["descricao"],
        nomeCitacao: profile["nomeCitacoes"],
        artigos: List<Artigo>(),
        eventos: List<Evento>(),
      );
    }

    return CurriculoLattes(
      lattesID: json["lattesID"],
      nome: json["nome"],
      descricao: json["descricao"],
      nomeCitacao: json["nomeCitacao"],
      artigos: List<Artigo>(),
      eventos: List<Evento>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lattesID": lattesID,
      "nome": nome,
      "nomeCitacao": nomeCitacao,
      "descricao": descricao,
      "eventos": eventos,
      "artigos": artigos
    };
  }

  @override
  String toString() {
    return "nome: $nome, lattesID: $lattesID, nomeCitacao: $nomeCitacao, descricao: $descricao, eventos: $eventos, artigos: $artigos";
  }
}
