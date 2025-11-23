import 'package:flutter/material.dart';
import 'package:shopping_app/mock_data.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';
import 'package:shopping_app/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Bata', 'Nike'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
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
