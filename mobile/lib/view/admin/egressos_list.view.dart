import 'package:flutter/material.dart';
import 'package:mobile/components/egresso_list_row.dart';
import 'package:mobile/controller/admin/egressos_list.controller.dart';

class EgressosListView extends StatefulWidget {
  static final route = '/consulta';
  @override
  _EgressosListViewState createState() => _EgressosListViewState();
}

class _EgressosListViewState extends State<EgressosListView> {
  var controller = EgressosListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Egressos'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return EgressoListRow(
            imagemURL: "",
            corBordaImagem: Colors.red,
            nome: 'Lívia Danúbia',
            cargo:
                'Professora no departamento de engenharia da Universidade Católica de Brasília',
            grau: 'Doutor',
            isFirst: index == 0,
            onPressed: () {
              print('object');
            },
          );
        },
      ),
    );
  }
}




