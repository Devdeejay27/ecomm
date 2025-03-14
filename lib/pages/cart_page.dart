import 'package:ecomm/components/my_button.dart';
import 'package:ecomm/models/product.dart';
import 'package:ecomm/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // cancel button
            children: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),

              // yes button
              MaterialButton(
                onPressed: () {
                  // pop
                  Navigator.pop(context);

                  // remove from cart
                  context.read<Shop>().removeFromCart(product);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //pay button pressed method
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          'User wants to pay! Connect this app to your payment backend',
        ),
        actions: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Cart Page',
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text('Your cart is empty...'),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual items in cart
                      final item = cart[index];
                      // return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text('PAY NOW'),
            ),
          ),
        ],
      ),
    );
  }
}
