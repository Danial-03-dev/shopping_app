import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: Colors.black54,
          ),
          Text('Empty Cart', style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
    );
  }
}
