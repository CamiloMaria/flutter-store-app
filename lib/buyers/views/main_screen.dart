import 'package:flutter/material.dart';

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

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  const CustomBottomNavigationBar({
    required this.currentPage,
    required this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xffce0611),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentPage,
      onTap: onPageChanged,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 30),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined, size: 30),
          label: 'FAVORITES',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store_outlined, size: 30),
          label: 'STORE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined, size: 30),
          label: 'CART',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30),
          label: 'PROFILE',
        ),
      ],
    );
  }
}
