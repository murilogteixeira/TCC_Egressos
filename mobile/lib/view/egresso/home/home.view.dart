import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/egresso/home.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/view/egresso/home/producoes.view.dart';

import '../../../globals.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key, this.title, this.egresso}) : super(key: key);

  final String title;
  final Egresso egresso;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: mainColor,
        ),
        body: Observer(
          builder: (_) {
            return ProducoesView(
              producoes: _controller.producoes,
              mediaProducoes: _controller.mediaProducoes,
            );
          },
        ),
      ),
    );
  }
}
