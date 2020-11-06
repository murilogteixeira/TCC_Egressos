import 'package:flutter/material.dart';
import 'package:mobile/components/organize_charts.model.dart';
import 'package:mobile/controller/shared/login.controller.dart';
import 'package:mobile/model/curriculo_lattes/banca/banca.dart';
import 'package:mobile/model/usuario.dart';

class BancasView extends StatefulWidget {
  const BancasView({Key key, this.bancas, this.mediaBancas}) : super(key: key);

  final List<Banca> bancas;
  final List<int> mediaBancas;

  @override
  _BancasViewState createState() => _BancasViewState();
}

class _BancasViewState extends State<BancasView> {
  Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return widget.bancas.isEmpty //|| widget.mediaBancas.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                OrganizeCharts().createCharts(
                  'Bancas',
                  _chartData(),
                  _chartAvarages(),
                ),
              ],
            ),
          );
  }

  List<ChartsData> _chartData() {
    var listType = widget.bancas.map((e) => e.tipo.descricao);
    Map<String, int> map = Map();
    listType.forEach((i) {
      var count = map[i];
      map['$i'] = count == null ? 1 : count + 1;
    });
    List<ChartsData> charsData = [];
    map.forEach((key, value) {
      charsData.add(ChartsData(key, value));
    });
    return charsData;
  }

  List<int> _chartAvarages() {
    return [51, 20, 30, 40, 50];
  }
}
