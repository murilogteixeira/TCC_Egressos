class Evento {
  final String nome;
  final String descricao;
  final DateTime data;

  Evento({this.nome, this.descricao, this.data});

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      nome: "nome",
      data: DateTime.now(),
      descricao: json["descricao"],
    );
  }
}