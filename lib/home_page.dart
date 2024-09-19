import 'package:commerce/pages/user_account.dart';
import 'package:commerce/pages/user_home.dart';
import 'package:commerce/pages/user_list.dart';
import 'package:commerce/pages/user_wish.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    
    UserHome(),
    UserWish(),
    UserList(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: "wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "list"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ]),
    );
  }
}
