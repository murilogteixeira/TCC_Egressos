import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/controller/egresso/home.controller.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/view/egresso/home/producoes.view.dart';

import '../../../globals.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key, this.egresso}) : super(key: key);

  // final String titulo;
  final Egresso egresso;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child:
    return Scaffold(
      appBar: AppBar(
        title: Text('Produções'),
        backgroundColor: mainColor,
      ),
      body: ProducoesView(
        // producoes: controller.producoes,
        // mediaProducoes: controller.mediaProducoes,
        egresso: widget.egresso,
      ),
    );
    // );
  }
}
