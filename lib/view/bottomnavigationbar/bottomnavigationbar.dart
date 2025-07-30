import 'package:flutter/material.dart';
import 'package:nike_project/view/bagscreen/bagscreen.dart';
import 'package:nike_project/view/favoroute_screen/favourite_screen.dart';
import 'package:nike_project/view/homescreen/homescreen.dart';
import 'package:nike_project/view/profilescreen/profilescree.dart';
import 'package:nike_project/view/shopscreen/shopscreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedTab = 0;

  final List<Widget> screens = [
    Homescreen(),
    ShopScreen(),
    FavouriteScreen(), // Wishlist
    BagScreen(),
    ProfileScreen(), // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedTab],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(icon: Icons.home_outlined, index: 0),
            buildNavItem(icon: Icons.shopping_bag_outlined, index: 1),
            buildNavItem(icon: Icons.favorite_border, index: 2),
            buildNavItem(icon: Icons.shopping_cart_outlined, index: 3),
            buildNavItem(icon: Icons.person_outline, index: 4),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem({required IconData icon, required int index}) {
    final bool isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 2,
              width: 20,
              color: Colors.black,
            )
          else
            const SizedBox(height: 2),
        ],
      ),
    );
  }
}
