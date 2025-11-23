import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/classes/provider/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product['sizes'][0];
  }

  void handleAddToCart() {
    Provider.of<CartProvider>(context, listen: false).addProduct({
      'id': widget.product['id'],
      'title': widget.product['title'],
      'price': widget.product['price'],
      'imageUrl': widget.product['imageUrl'],
      'company': widget.product['company'],
      'size': selectedSize,
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Product added to cart')));
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.product['title'];
    final String imageUrl = widget.product['imageUrl'];
    final String price = widget.product['price'].toString();
    final List<int> sizes = widget.product['sizes'];

    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 612, maxHeight: 356),
              child: Image(image: AssetImage(imageUrl)),
            ),
          ),
          Spacer(),
          Container(
            height: 258,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(48),
            ),
            child: Column(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$$price', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 48,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (context, index) {
                      final size = sizes[index];
                      final Color? chipColor = selectedSize == size
                          ? Theme.of(context).colorScheme.primary
                          : null;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: chipColor,
                            label: Text(size.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: const Size(412, 50),
                  ),
                  onPressed: handleAddToCart,
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
