import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/classes/provider/cart_provider.dart';
import 'package:shopping_app/widgets/cart_item.dart';
import 'package:shopping_app/widgets/delete_dialogue.dart';
import 'package:shopping_app/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    void handleRemoveFromCart(Map<String, dynamic> cartItem) {
      context.read<CartProvider>().removeProduct(cartItem);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Product removed')));
    }

    void handleDeleteCartItem(Map<String, dynamic> cartItem) {
      showDialog(
        context: context,
        builder: (context) {
          return DeleteDialogue(
            title: 'Delete Product',
            description:
                'Are you sure you want to remove this product from cart?',
            onAccept: () {
              handleRemoveFromCart(cartItem);
              Navigator.of(context).pop();
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.isEmpty
          ? EmptyCart()
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];

                return CartItem(
                  itemData: cartItem,
                  onPressed: () {
                    handleDeleteCartItem(cartItem);
                  },
                );
              },
            ),
    );
  }
}
