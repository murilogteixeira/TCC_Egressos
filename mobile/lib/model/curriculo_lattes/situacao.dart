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
