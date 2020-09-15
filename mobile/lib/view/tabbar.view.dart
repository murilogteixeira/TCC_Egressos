import 'package:flutter/material.dart';
import 'package:mobile/view/home/home.view.dart';
import 'package:mobile/view/perfil.view.dart';

class TabBarAppView extends StatefulWidget {
  static final route = '/homeEgresso';
  @override
  _TabBarAppViewState createState() => _TabBarAppViewState();
}

class _TabBarAppViewState extends State<TabBarAppView> {
  var _selectedIndex = 0;
  
  static const String _tituloHome = 'Comparativos';
  static const String _tituloPerfil = 'Perfil';

  static List<Widget> _widgetOptions = [
    HomeView(title: _tituloHome),
    PerfilView(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
