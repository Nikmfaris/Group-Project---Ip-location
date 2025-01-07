import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iplocation/pages/navigation/MapPage.dart';
import 'package:iplocation/pages/navigation/MoneyPage.dart';
import 'package:iplocation/pages/navigation/ProfilePage.dart';
import 'package:iplocation/pages/navigation/ipgeo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    IpGeoPage(),
    MapPage(),
    MoneyPage(),
    ProfilePage(),
  ];

  final List<Color> _backgroundColors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.redAccent,
  ];

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.event, size: 20),
          Icon(Icons.map, size: 20),
          Icon(Icons.monetization_on, size: 20),
          Icon(Icons.settings, size: 20),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: _backgroundColors[_selectedIndex],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: _handleIndexChanged,
        letIndexChange: (index) => true,
      ),
    );
  }
}
