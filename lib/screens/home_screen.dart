import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 0;

  List<Widget> screens = [ProductsScreen(), CartScreen()];

  void handleBottomNavigation(int value) {
    setState(() {
      currentScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentScreen, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        iconSize: 32,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: handleBottomNavigation,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
