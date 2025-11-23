import 'package:flutter/material.dart';

class ProductSearchHeader extends StatelessWidget {
  const ProductSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return Row(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Shoes\nCollection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        ),
      ],
    );
  }
}
