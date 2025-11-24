import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/classes/provider/products_provider.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';
import 'package:shopping_app/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductsProvider>().filteredProducts();
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 512,
          mainAxisExtent: 328,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          final backgroundColor = index.isEven
              ? Color.fromRGBO(216, 240, 253, 1)
              : Color.fromRGBO(245, 247, 249, 1);

          void handleCardTap() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ),
            );
          }

          return GestureDetector(
            onTap: handleCardTap,
            child: ProductCard(
              productData: product,
              backgroundColor: backgroundColor,
            ),
          );
        },
      ),
    );
  }
}
