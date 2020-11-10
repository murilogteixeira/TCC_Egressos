// import 'package:mobx/mobx.dart';
// part 'situacao.g.dart';

class Situacao {
  int id;
  String tipo;

  Situacao({this.id, this.tipo});

  Situacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['tipo'] != null) tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipo'] = this.tipo;
    return data;
  }
}

// class Situacao = _SituacaoBase with _$Situacao;

// abstract class _SituacaoBase with Store {
//   _SituacaoBase({this.id, this.tipo});

//   @observable
//   int id;
//   @action
//   setId(value) => id = value;

//   @observable
//   String tipo;
//   @action
//   setTipo(value) => tipo = value;

//   fromJson(Map<String, dynamic> json) {
//     return Situacao(id: json["id"], tipo: json["tipo"]);
//   }

//   toJson() {
//     return {"id": id, "tipo": tipo};
//   }
// }
