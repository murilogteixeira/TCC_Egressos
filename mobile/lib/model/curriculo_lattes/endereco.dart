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