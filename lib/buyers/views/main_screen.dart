import 'package:flutter/material.dart';
import 'package:project/shared/widget/bottom_navbar.dart';

import 'navigation/cart_screen.dart';
import 'navigation/favorites_screen.dart';
import 'navigation/home_screen.dart';
import 'navigation/profile_screen.dart';
import 'navigation/store_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritesPage(),
    const StorePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: _currentPage,
        onPageChanged: _onPageChanged,
      ),
      body: _pages[_currentPage],
    );
  }
}
