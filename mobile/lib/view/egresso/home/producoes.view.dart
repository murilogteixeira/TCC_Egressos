import 'package:flutter/material.dart';
import 'package:mobile/components/organize_charts.model.dart';

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
          OrganizeCharts().createCharts(
            'Produções',
            dataExemplo,
            [3, 1, 6, 3, 2],
          ),
        ],
      ),
    );
  }
}

final dataExemplo = [
  new ChartsData(
    "Participação em eventos, congressos, exposições e feiras ",
    2,
  ),
  new ChartsData(
    "Organização de eventos, congressos, exposições e feiras ",
    1,
  ),
  new ChartsData(
    "Artigos publicados ",
    4,
  ),
  new ChartsData(
    "Menções em obras ",
    2,
  ),
  new ChartsData(
    "Participação em bancas ",
    1,
  ),
];
