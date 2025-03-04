import 'package:ecomm/pages/intro_page.dart';
import 'package:ecomm/pages/shop_page.dart';
import 'package:ecomm/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const EcommApp(),
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
      },
    );
  }
}
