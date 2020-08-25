class ListaDetalhes {
  ListaDetalhes({this.titulo, this.lista});

  final String titulo;
  final List<ItemListaDetalhes> lista;
}

class ItemListaDetalhes {
  ItemListaDetalhes({this.subtitulo, this.corpo});

  final String subtitulo;
  final List<String> corpo;
}
