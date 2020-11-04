import 'package:flutter/material.dart';
import 'package:mobile/model/curriculo_lattes/egresso.dart';
import 'package:mobile/model/usuario.dart';
import 'package:mobile/view/egresso/home/home.view.dart';
import 'package:mobile/view/egresso/Perfil/perfil.view.dart';

class TabBarAppView extends StatefulWidget {
  static final route = '/tabBarView';

  const TabBarAppView({Key key, this.egresso}) : super(key: key);
  
  final Egresso egresso;

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
    var egresso = widget.egresso;

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
            label: _tituloHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: _tituloPerfil,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff547DD9),
        onTap: _onItemTapped,
      ),
    );
  }
}
