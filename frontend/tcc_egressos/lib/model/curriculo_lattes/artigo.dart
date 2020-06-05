class Artigo {
  final String nome;
  final DateTime dataPublicacao;
  final String descricao;

  Artigo({this.nome, this.dataPublicacao, this.descricao});

  factory Artigo.fromJson(Map<String, dynamic> json) {
    return Artigo(
      nome: "nome",
      dataPublicacao: DateTime.now(),
      descricao: json["descricao"],
    );
  }
}