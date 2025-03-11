import 'package:ecomm/models/shop.dart';
import 'package:ecomm/pages/cart_page.dart';
import 'package:ecomm/pages/intro_page.dart';
import 'package:ecomm/pages/shop_page.dart';
import 'package:ecomm/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const EcommApp(),
    ),
  );
}

class EcommApp extends StatelessWidget {
  const EcommApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
