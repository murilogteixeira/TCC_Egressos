import 'package:flutter/material.dart';
import 'package:tcc_egressos/components/lista_detalhes_widget.dart';

class DadosGeraisWidget extends StatelessWidget {
  const DadosGeraisWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: ListaDetalhesWidget()),
    );
  }
}
