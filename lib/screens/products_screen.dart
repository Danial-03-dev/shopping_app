import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_app/features/product_company_filters.dart';
import 'package:shopping_app/features/product_list.dart';
import 'package:shopping_app/features/product_search_header.dart';
import 'package:shopping_app/widgets/custom_scroll_config.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollConfig(
        child: Column(
          children: [
            ProductSearchHeader(),
            ProductCompanyFilters(),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
