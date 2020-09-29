import 'package:flutter/material.dart';
import 'package:mobile/components/organize_charts.model.dart';
import 'package:mobile/controller/login.controller.dart';
import 'package:mobile/model/usuario.dart';

class BancasView extends StatefulWidget {
  @override
  _BancasViewState createState() => _BancasViewState();
}

class _BancasViewState extends State<BancasView> {
  Usuario usuario;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          OrganizeCharts().createCharts(
            'Bancas',
            dataExemplo,
            [51, 20, 30, 40, 50],
          ),
        ],
      ),
    );
  }
}

final dataExemplo = [
  new ChartsData(
    "Participação em eventos, congressos, exposições e feiras ",
    50,
  ),
  new ChartsData(
    "Organização de eventos, congressos, exposições e feiras ",
    71,
  ),
  new ChartsData(
    "Artigos publicados ",
    40,
  ),
  new ChartsData(
    "Menções em obras ",
    40,
  ),
  new ChartsData(
    "Participação em bancas ",
    40,
  ),
];
