import 'package:flutter/material.dart';
import 'package:mobile/model/charts/organize_charts.model.dart';

class ProducoesView extends StatefulWidget {
  @override
  _ProducoesViewState createState() => _ProducoesViewState();
}

class _ProducoesViewState extends State<ProducoesView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrganizeCharts().createCharts('Produções', dataExemplo, [100, 200, 300, 400, 500]),
        ],
      ),
    );
  }
}

final dataExemplo = [
  new ChartsData(
      "Participação em eventos, congressos, exposições e feiras ",
      500,),
  new ChartsData(
      "Organização de eventos, congressos, exposições e feiras ",
      710,
      ),
  new ChartsData(
      "Artigos publicados ",
      400,
      ),
  new ChartsData(
      "Menções em obras ",
      400,
      ),
  new ChartsData(
      "Participação em bancas ",
      400,
      ),
  
];