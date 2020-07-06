class Cargo {
  String cargo;
  String instituicao;

  Cargo({this.cargo, this.instituicao});

  Map<String, dynamic> toJson() {
    return {'cargo': cargo, 'instituicao': instituicao};
  }

  Cargo fromJson(json) {
    return Cargo(cargo: json['cargo'], instituicao: json['instituicao']);
  }
}
