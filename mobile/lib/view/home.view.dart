import 'package:flutter/material.dart';

class HomeEgressoView extends StatefulWidget {
  static final route = '/homeEgresso';
  @override
  _HomeEgressoViewState createState() => _HomeEgressoViewState();
}

class _HomeEgressoViewState extends State<HomeEgressoView> {
  var _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = [
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Perfil',
      style: optionStyle,
    ),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Perfil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
