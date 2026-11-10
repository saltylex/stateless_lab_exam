import 'package:flutter/material.dart';
import 'shopping_cart_page.dart';

void main() => runApp(const CampusStoreApp());

class CampusStoreApp extends StatelessWidget {
  const CampusStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Store',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1D5FF2)),
        scaffoldBackgroundColor: const Color(0xFFF3F5FA),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF142044)),
        ),
      ),
      home: const ShoppingCartPage(),
    );
  }
}
