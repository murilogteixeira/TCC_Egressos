class Atuacao {
  String cargo;
  String instituicao;
  String dataInicio;
  String dataFim;
  String descricao;

  Atuacao({
    this.cargo,
    this.instituicao,
    this.dataInicio,
    this.dataFim,
    this.descricao,
  });

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo,
      'instituicao': instituicao,
      'data_inicio': dataInicio,
      'data_fim': dataFim,
      'descricao': descricao
    };
  }

  Atuacao fromJson(Map<String, dynamic> json) {
    return Atuacao(
      cargo: json['cargo'],
      instituicao: json['instituicao'],
      dataInicio: json['data_inicio'],
      dataFim: json['data_fim'],
      descricao: json['descricao'],
    );
  }
}
