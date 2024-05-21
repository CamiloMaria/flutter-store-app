import 'package:flutter/material.dart';

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
      selectedItemColor: const Color(0xffce0611),
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
