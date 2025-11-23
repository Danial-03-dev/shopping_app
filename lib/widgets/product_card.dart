import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> productData;
  final Color backgroundColor;

  const ProductCard({
    super.key,
    required this.productData,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final String title = productData['title'];
    final String price = productData['price'].toString();
    final String imageUrl = productData['imageUrl'];

    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(20),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
            Center(child: Image(height: 175, image: AssetImage(imageUrl))),
          ],
        ),
      ),
    );
  }
}
