import 'package:ecomm/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(
      name: 'Cargo Pants',
      price: 59.99,
      description:
          'Sweet green medium cargo pants with elastic band to fit all sizes',
      imagePath: 'assets/cargo_pic.png',
    ),
    // product 2
    Product(
      name: 'Leather Jacket',
      price: 69.99,
      description: 'Dark leather jackets, perfect for cold weathers and bikers',
      imagePath: 'assets/jacket_pic.png',
    ),
    // product 3
    Product(
      name: 'Patek Phillipe Watch',
      price: 99.99,
      description:
          'Watch screaming luxury and style, perfect to complete your outfit',
      imagePath: 'assets/watch_pic.png',
    ),
    // product 4
    Product(
      name: 'Asad Lattafa',
      price: 89.99,
      description: 'Want to smell edible and sexy? This is the one for you',
      imagePath: 'assets/perfume_pic.png',
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
