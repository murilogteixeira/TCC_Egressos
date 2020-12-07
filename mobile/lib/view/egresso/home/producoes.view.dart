import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/components/organize_charts.model.dart';
import 'package:mobile/controller/egresso/producoes.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

class ProducoesView extends StatefulWidget {
  const ProducoesView({
    Key key,
    // this.producoes,
    // this.mediaProducoes,
    this.egresso,
  }) : super(key: key);

  // final ObservableList<Producao> producoes;
  // final ObservableList<MediaProducao> mediaProducoes;
  final Egresso egresso;

  @override
  _ProducoesViewState createState() => _ProducoesViewState();
}

class _ProducoesViewState extends State<ProducoesView> {
  ProducoesController _controller;
  List<_TipoProducao> tiposProducao = [];
  List<int> mediasProducao = [];

  @override
  Widget build(BuildContext context) {
    _controller = ProducoesController(egresso: widget.egresso);
    _controller.fetchData(widget.egresso.id);

    return Observer(builder: (context) {
      if (_controller.isLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (_controller.mediaProducoes.isEmpty) {
        return Center(child: Text('Nenhuma produção.'));
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            OrganizeCharts().createCharts(
              'Produções',
              _chartData(),
              _chartAvarages(),
            ),
          ],
        ),
      );
    });
  }

  List<ChartsData> _chartData() {
    var listType = _controller.mediaProducoes.map((e) => e.tipo);

    // Map<String, int> map = Map();
    // listType.forEach((i) {
    //   var count = map[i];
    //   map['$i'] = count == null ? 1 : count + 1;
    // });

    // map.forEach((key, value) {
    //   var tipo = _TipoProducao(nome: key, quantidade: value);

    //   tipo.id = _controller.mediaProducoes
    //       .firstWhere((element) => element.tipo == key)
    //       .tipoId;

    //   tiposProducao.add(tipo);
    // });

    // return tiposProducao.map((e) => ChartsData(e.nome, e.quantidade)).toList();
    var list =
        _controller.mediaProducoes.map((e) => ChartsData(e.tipo, e.egresso)).toList();
    return list;
  }

  List<int> _chartAvarages() {
    _controller.mediaProducoes.sort((a, b) => a.tipoId.compareTo(b.tipoId));
    return _controller.mediaProducoes.map((e) => e.media).toList();
  }
}

class _TipoProducao {
  int id;
  String nome;
  int quantidade;

  _TipoProducao({this.id, this.nome, this.quantidade});
}
