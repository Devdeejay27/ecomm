import 'package:ecomm/pages/intro_page.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
