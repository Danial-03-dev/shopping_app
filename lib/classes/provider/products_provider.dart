import 'package:flutter/material.dart';
import 'package:shopping_app/mock_data.dart' as mock_products;

class ProductsProvider extends ChangeNotifier {
  final _products = mock_products.products;
  String _search = "";
  String _companyFilter = "";

  void setSearch(String search) {
    _search = search;
    notifyListeners();
  }

  void setCompanyFilter(String filterCompany) {
    _companyFilter = filterCompany;
    notifyListeners();
  }

  List<Map<String, Object>> filteredProducts() {
    return _products.where((product) {
      final title = product['title'].toString().toLowerCase();
      final productCompany = product['company'].toString().toLowerCase();

      final searchLower = _search.toLowerCase();
      final companyLower = _companyFilter.toLowerCase();

      final matchesSearch = _search.isEmpty || title.contains(searchLower);

      final matchesCompany =
          _companyFilter == 'All' ||
          _companyFilter.isEmpty ||
          productCompany.contains(companyLower);

      return matchesSearch && matchesCompany;
    }).toList();
  }
}
