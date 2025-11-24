import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/classes/provider/products_provider.dart';
import 'package:shopping_app/mock_data.dart';
import 'package:shopping_app/widgets/custom_filter_chip.dart';

class ProductCompanyFilters extends StatefulWidget {
  const ProductCompanyFilters({super.key});

  @override
  State<ProductCompanyFilters> createState() => _ProductCompanyFiltersState();
}

class _ProductCompanyFiltersState extends State<ProductCompanyFilters> {
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsProvider>().setCompanyFilter(filters[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];

          void handleFilter() {
            setState(() {
              selectedFilter = filter;
              context.read<ProductsProvider>().setCompanyFilter(selectedFilter);
            });
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomFilterChip(
              onTap: handleFilter,
              label: filter,
              selectedFilter: selectedFilter,
            ),
          );
        },
      ),
    );
  }
}
