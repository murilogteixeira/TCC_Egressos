import 'package:tcc_egressos/model/curriculo_lattes/banca/tipoBanca.dart';

class Banca {
  int id;
  String titulo;
  String descricao;
  String ano;
  TipoBanca tipo;

  Banca({this.id, this.titulo, this.descricao, this.ano, this.tipo});

  Banca.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    ano = json['ano'];
    tipo = json['tipo'] != null ? new TipoBanca.fromJson(json['tipo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['ano'] = this.ano;
    if (this.tipo != null) {
      data['tipo'] = this.tipo.toJson();
    }
    return data;
  }
}
