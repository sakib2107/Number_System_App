import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex=0;
  final List<Widget> _screens=[
     Home(),
     About(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 55,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex=index;
          setState(() {

          });
        },
        destinations: [
          NavigationDestination(icon:Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon:Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
