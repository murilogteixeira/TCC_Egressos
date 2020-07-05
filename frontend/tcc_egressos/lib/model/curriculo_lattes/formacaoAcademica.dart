class FormacaoAcademica {
  String curso;
  String instituicao;
  String dataInicio;
  String dataFim;
  String area;

  FormacaoAcademica({
    this.curso,
    this.instituicao,
    this.dataInicio,
    this.dataFim,
    this.area,
  });

  Map<String, dynamic> toJson() {
    return {
      'curso': curso,
      'instituicao': instituicao,
      'data_inicio': dataInicio,
      'data_fim': dataFim,
      'grande_area': area
    };
  }

  FormacaoAcademica fromJson(Map<String, dynamic> json) {
    return FormacaoAcademica(
      curso: json['curso'],
      instituicao: json['instituicao'],
      dataInicio: json['data_inicio'],
      dataFim: json['data_fim'],
      area: json['grande_area'],
    );
  }
}
