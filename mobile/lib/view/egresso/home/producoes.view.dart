import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/components/organize_charts.model.dart';
import 'package:mobile/controller/producoes.controller.dart';
import 'package:mobile/model/curriculo_lattes/producao/producao.dart';
import 'package:mobx/mobx.dart';

class ProducoesView extends StatefulWidget {
  const ProducoesView({Key key, this.producoes, this.mediaProducoes})
      : super(key: key);

  final ObservableList<Producao> producoes;
  final ObservableList<MediaProducao> mediaProducoes;

  @override
  _ProducoesViewState createState() => _ProducoesViewState();
}

class _ProducoesViewState extends State<ProducoesView> {
  List<_TipoProducao> tiposProducao = [];
  List<int> mediasProducao = [];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return widget.producoes.isEmpty //|| widget.mediaProducoes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Observer(
                    builder: (_) {
                      return OrganizeCharts().createCharts(
                        'Produções',
                        _chartData(),
                        _chartAvarages(),
                      );
                    },
                  ),
                ],
              ),
            );
    });
  }

  List<ChartsData> _chartData() {
    var listType = widget.producoes.map((e) => e.tipo.nome);

    Map<String, int> map = Map();
    listType.forEach((i) {
      var count = map[i];
      map['$i'] = count == null ? 1 : count + 1;
    });

    map.forEach((key, value) {
      var tipo = _TipoProducao(nome: key, quantidade: value);

      tipo.id = widget.mediaProducoes
          .firstWhere((element) => element.tipo == key)
          .tipoId;

      tiposProducao.add(tipo);
    });

    return tiposProducao.map((e) => ChartsData(e.nome, e.quantidade)).toList();
  }

  List<int> _chartAvarages() {
    widget.mediaProducoes.sort((a,b) => a.tipoId.compareTo(b.tipoId));
    
    return widget.mediaProducoes.map((element) => element.media).toList();
  }
}

class _TipoProducao {
  int id;
  String nome;
  int quantidade;

  _TipoProducao({this.id, this.nome, this.quantidade});
}
