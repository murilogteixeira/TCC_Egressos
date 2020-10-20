import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/home.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/view/egresso/home/bancas.view.dart';
import 'package:mobile/view/egresso/home/producoes.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key, this.title, this.egresso}) : super(key: key);

  final String title;
  final Egresso egresso;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // static const _tituloProducoes = 'Produções';
  // static const _tituloBancas = 'Bancas';

  var _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // bottom: TabBar(
          //   indicatorColor: Colors.white,
          //   // tabs: [
          //   //   Tab(child: Text(_tituloProducoes)),
          //   //   // Tab(child: Text(_tituloBancas)),
          //   // ],
          // ),
          backgroundColor: Color(0xff30559F),
        ),
        body: Observer(
          builder: (_) {
            return ProducoesView(producoes: _controller.producoes, mediaProducoes: _controller.mediaProducoes);
          },
        ),
      ),
    );
  }
}
