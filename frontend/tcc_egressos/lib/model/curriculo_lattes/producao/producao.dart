import 'package:tcc_egressos/model/curriculo_lattes/producao/tipoProducao.dart';

class Producao {
  int id;
  String titulo;
  String descricao;
  String ano;
  TipoProducao tipo;

  Producao({this.id, this.titulo, this.descricao, this.ano, this.tipo});

  Producao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    ano = json['ano'];
    tipo =
        json['tipo'] != null ? new TipoProducao.fromJson(json['tipo']) : null;
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
