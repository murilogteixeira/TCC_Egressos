import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const _tituloProducoes = 'Produções';
  static const _tituloBancas = 'Bancas';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(child: Text(_tituloProducoes)),
              Tab(child: Text(_tituloBancas)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('Produções'),
            Text('Bancas'),
          ],
        ),
      ),
    );
  }
}
