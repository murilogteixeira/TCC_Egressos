import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/components/organize_charts.model.dart';
import 'package:mobile/controller/egresso/producoes.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';

class ProducoesView extends StatefulWidget {
  const ProducoesView({
    Key key,
    this.egresso,
  }) : super(key: key);

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
      return _controller.isLoading
      ? Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
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
    var list = _controller.mediaProducoes
        .map((e) => ChartsData(e.tipo, e.egresso))
        .toList();
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
