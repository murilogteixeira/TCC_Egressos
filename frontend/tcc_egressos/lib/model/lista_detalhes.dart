class ListaDetalhes {
  ListaDetalhes(this.titulo, this.lista);

  final String titulo;
  final List<ItemListaDetalhes> lista;
}

class ItemListaDetalhes {
  ItemListaDetalhes(this.descricao, this.inicio, this.fim, this.atual);

  final String descricao;
  final String inicio;
  final String fim;
  final bool atual;
}
