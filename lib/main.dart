import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/classes/provider/cart_provider.dart';
import 'package:shopping_app/classes/provider/products_provider.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/theme/material_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ],
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
