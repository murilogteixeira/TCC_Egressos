// import 'package:mobx/mobx.dart';
// part 'endereco.g.dart';

// class Endereco = _EnderecoBase with _$Endereco;

// abstract class _EnderecoBase with Store {
//   _EnderecoBase({this.cep, this.bairro, this.cidade, this.uf});

//   @observable
//   String cep;
//   @action
//   setCep(value) => cep = value;

//   @observable
//   String bairro;
//   @action
//   setBairro(value) => bairro = value;

//   @observable
//   String cidade;
//   @action
//   setCidade(value) => cidade = value;

//   @observable
//   String uf;
//   @action
//   setUF(value) => uf = value;

//   fromJson(Map<String, dynamic> json) {
//     return Endereco(
//         cep: json["cep"],
//         bairro: json["bairro"],
//         cidade: json["cidade"],
//         uf: json["uf"]);
//   }

//   toJson() {
//     return {"cep": cep, "bairro": bairro, "cidade": cidade, "uf": uf};
//   }
// }

class Endereco {
  int id;
  String cep;
  String bairro;
  String estado;
  String uf;

  Endereco({this.id, this.cep, this.bairro, this.estado, this.uf});

  Endereco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cep = json['cep'];
    bairro = json['bairro'];
    estado = json['estado'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cep'] = this.cep;
    data['bairro'] = this.bairro;
    data['estado'] = this.estado;
    data['uf'] = this.uf;
    return data;
  }
}
