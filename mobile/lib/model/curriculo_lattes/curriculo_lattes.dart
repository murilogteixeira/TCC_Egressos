import 'package:intl/intl.dart';
import 'situacao.dart';

// class CurriculoLattes {
//   final int id;
//   final String lattesID;
//   final String nome;
//   final DateTime dataNasc;
//   final String nomeCitacao;
//   final String ceular;
//   final String email;
//   final String descricao;
//   final List<Evento> eventos;
//   final List<Artigo> artigos;

//   CurriculoLattes({this.id, this.dataNasc, this.ceular, this.email,
//       this.lattesID,
//       this.nome,
//       this.descricao,
//       this.nomeCitacao,
//       this.eventos,
//       this.artigos});

//   factory CurriculoLattes.fromJson(Map<String, dynamic> json) {
//     if (json["profile"] != null) {
//       var profile = json["profile"];
//       return CurriculoLattes(
//         lattesID: profile["idLattes"],
//         nome: profile["nome"],
//         descricao: profile["descricao"],
//         nomeCitacao: profile["nomeCitacoes"],
//         artigos: List<Artigo>(),
//         eventos: List<Evento>(),
//       );
//     }

//     return CurriculoLattes(
//       lattesID: json["lattesID"],
//       nome: json["nome"],
//       descricao: json["descricao"],
//       nomeCitacao: json["nomeCitacao"],
//       artigos: List<Artigo>(),
//       eventos: List<Evento>(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "lattesID": lattesID,
//       "nome": nome,
//       "nomeCitacao": nomeCitacao,
//       "descricao": descricao,
//       "eventos": eventos,
//       "artigos": artigos
//     };
//   }

//   @override
//   String toString() {
//     return "nome: $nome, lattesID: $lattesID, nomeCitacao: $nomeCitacao, descricao: $descricao, eventos: $eventos, artigos: $artigos";
//   }
// }

import 'package:mobx/mobx.dart';

import 'endereco.dart';
part 'curriculo_lattes.g.dart';

class CurriculoLattes = _CurriculoLattesBase with _$CurriculoLattes;

abstract class _CurriculoLattesBase with Store {
  _CurriculoLattesBase(
      {this.id,
      this.dataNasc,
      this.celular,
      this.email,
      this.lattesID,
      this.nome,
      this.descricao,
      this.nomeCitacao,
      this.endereco,
      this.situacao});

  @observable
  int id;
  @action
  setId(value) => id = value;

  @observable
  String lattesID;
  @action
  setLattesID(value) => lattesID = value;

  @observable
  String nome;
  @action
  setNome(value) => nome = value;

  @observable
  DateTime dataNasc;
  @action
  setDataNasc(value) => dataNasc = value;

  @observable
  String nomeCitacao;
  @action
  setNomeCitacao(value) => nomeCitacao = value;

  @observable
  String celular;
  @action
  setCelular(value) => celular = value;

  @observable
  String email;
  @action
  setEmail(value) => email = value;

  @observable
  String descricao;
  @action
  setDescricao(value) => descricao = value;

  @observable
  Endereco endereco;
  @action
  setEndereco(value) => endereco = value;

  @observable
  Situacao situacao;
  @action
  setSituacao(value) => situacao = value;

  fromJson(Map<String, dynamic> json) {
    var f = DateFormat("yyyy-MM-dd");
    return CurriculoLattes(
      id: json["id"],
      lattesID: json["idLattes"],
      nome: json["nome"],
      dataNasc: f.parse(json["d_nasc"]),
      nomeCitacao: json["nomeCitacoes"],
      celular: json["celular"],
      email: json["email"],
      endereco: Endereco().fromJson(json["endereco"]),
      situacao: Situacao().fromJson(json["situacao"]),
    );
  }

  Map<String, dynamic> toJson() {
    var f = DateFormat("yyyy-MM-dd");
    return {
      "id": id,
      "idLattes": lattesID,
      "nome": nome,
      "d_nasc": f.format(dataNasc),
      "nomeCitacoes": nomeCitacao,
      "celular": celular,
      "email": email,
      "endereco": endereco.toJson(),
      "situacao": situacao.toJson(),
    };
  }

  @override
  String toString() {
    return "nome: $nome, lattesID: $lattesID, nomeCitacao: $nomeCitacao, descricao: $descricao";
  }
}
