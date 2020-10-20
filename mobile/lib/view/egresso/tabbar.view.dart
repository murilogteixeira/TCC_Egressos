import 'package:flutter/material.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/usuario.dart';
import 'package:mobile/view/egresso/home/home.view.dart';
import 'package:mobile/view/egresso/perfil.view.dart';

class TabBarAppView extends StatefulWidget {
  static final route = '/tabBarView';
  @override
  _TabBarAppViewState createState() => _TabBarAppViewState();
}

class _TabBarAppViewState extends State<TabBarAppView> {
  var _selectedIndex = 0;

  static const String _tituloHome = 'Produções';
  static const String _tituloPerfil = 'Perfil';

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Egresso egresso = ModalRoute.of(context).settings.arguments;

    List<Widget> _widgetOptions = [
      HomeView(
        title: _tituloHome,
        egresso: egresso,
      ),
      PerfilView(),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text(_tituloHome),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(_tituloPerfil),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff547DD9),
        onTap: _onItemTapped,
      ),
    );
  }
}
